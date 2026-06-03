package com.foodyman.demo

import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.hardware.usb.*
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.rokctapp.printer/usb"
    private var usbManager: UsbManager? = null
    private var usbDeviceConnection: UsbDeviceConnection? = null
    private var usbInterface: UsbInterface? = null
    private var usbEndpoint: UsbEndpoint? = null
    private var pendingPermissionIntent: PendingIntent? = null
    private var currentDevice: UsbDevice? = null

    private val ACTION_USB_PERMISSION by lazy { "$packageName.USB_PERMISSION" }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        usbManager = getSystemService(Context.USB_SERVICE) as UsbManager

        // Setup permission pending intent
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            PendingIntent.FLAG_MUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        } else {
            PendingIntent.FLAG_UPDATE_CURRENT
        }
        pendingPermissionIntent = PendingIntent.getBroadcast(this, 0, Intent(ACTION_USB_PERMISSION), flags)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getDevices" -> {
                    val devicesList = getUsbDevices()
                    result.success(devicesList)
                }
                "connect" -> {
                    val vendorId = call.argument<Int>("vendorId")
                    val productId = call.argument<Int>("productId")
                    if (vendorId != null && productId != null) {
                        connectToDevice(vendorId, productId, result)
                    } else {
                        result.error("INVALID_ARGUMENTS", "Vendor ID and Product ID must be provided", null)
                    }
                }
                "sendBytes" -> {
                    val bytes = call.argument<ByteArray>("bytes")
                    if (bytes != null) {
                        val success = writeBytes(bytes)
                        if (success) {
                            result.success(true)
                        } else {
                            result.error("WRITE_FAILURE", "Failed to write bytes to USB endpoint", null)
                        }
                    } else {
                        result.error("INVALID_ARGUMENTS", "Bytes must be provided", null)
                    }
                }
                "disconnect" -> {
                    disconnectDevice()
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getUsbDevices(): List<Map<String, Any>> {
        val list = mutableListOf<Map<String, Any>>()
        val devices = usbManager?.deviceList ?: return list
        for (device in devices.values) {
            var isPrinter = false
            for (i in 0 until device.interfaceCount) {
                val usbIntf = device.getInterface(i)
                if (usbIntf.interfaceClass == UsbConstants.USB_CLASS_PRINTER) {
                    isPrinter = true
                    break
                }
            }
            if (isPrinter || device.deviceClass == UsbConstants.USB_CLASS_PRINTER) {
                val map = mapOf(
                    "name" to (device.productName ?: "USB Printer"),
                    "manufacturer" to (device.manufacturerName ?: "Unknown"),
                    "vendorId" to device.vendorId,
                    "productId" to device.productId,
                    "deviceId" to device.deviceId
                )
                list.add(map)
            }
        }
        return list
    }

    private fun connectToDevice(vendorId: Int, productId: Int, result: MethodChannel.Result) {
        val devices = usbManager?.deviceList ?: run {
            result.success(false)
            return
        }
        var targetDevice: UsbDevice? = null
        for (device in devices.values) {
            if (device.vendorId == vendorId && device.productId == productId) {
                targetDevice = device
                break
            }
        }

        if (targetDevice == null) {
            result.error("DEVICE_NOT_FOUND", "Device with Vendor ID $vendorId and Product ID $productId not found", null)
            return
        }

        currentDevice = targetDevice

        if (!usbManager!!.hasPermission(targetDevice)) {
            val filter = IntentFilter(ACTION_USB_PERMISSION)
            registerReceiver(object : BroadcastReceiver() {
                override fun onReceive(context: Context, intent: Intent) {
                    val action = intent.action
                    if (ACTION_USB_PERMISSION == action) {
                        synchronized(this) {
                            val device: UsbDevice? = intent.getParcelableExtra(UsbManager.EXTRA_DEVICE)
                            if (intent.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)) {
                                device?.let {
                                    openDeviceConnection(it, result)
                                }
                            } else {
                                result.error("PERMISSION_DENIED", "Permission to access USB device was denied", null)
                            }
                        }
                    }
                    unregisterReceiver(this)
                }
            }, filter)
            usbManager!!.requestPermission(targetDevice, pendingPermissionIntent)
        } else {
            openDeviceConnection(targetDevice, result)
        }
    }

    private fun openDeviceConnection(device: UsbDevice, result: MethodChannel.Result) {
        disconnectDevice()

        val connection = usbManager?.openDevice(device) ?: run {
            result.error("OPEN_FAILED", "Failed to open USB device", null)
            return
        }

        var intf: UsbInterface? = null
        var endpoint: UsbEndpoint? = null

        for (i in 0 until device.interfaceCount) {
            val uIntf = device.getInterface(i)
            if (uIntf.interfaceClass == UsbConstants.USB_CLASS_PRINTER) {
                for (j in 0 until uIntf.endpointCount) {
                    val ep = uIntf.getEndpoint(j)
                    if (ep.type == UsbConstants.USB_ENDPOINT_XFER_BULK && ep.direction == UsbConstants.USB_DIR_OUT) {
                        intf = uIntf
                        endpoint = ep
                        break
                    }
                }
            }
            if (intf != null) break
        }

        if (intf == null || endpoint == null) {
            connection.close()
            result.error("INTERFACE_NOT_FOUND", "No valid bulk out printer interface/endpoint found", null)
            return
        }

        if (!connection.claimInterface(intf, true)) {
            connection.close()
            result.error("CLAIM_FAILED", "Failed to claim printer interface", null)
            return
        }

        usbDeviceConnection = connection
        usbInterface = intf
        usbEndpoint = endpoint
        result.success(true)
    }

    private fun writeBytes(bytes: ByteArray): Boolean {
        val conn = usbDeviceConnection ?: return false
        val ep = usbEndpoint ?: return false
        val timeout = 5000
        val transferred = conn.bulkTransfer(ep, bytes, bytes.size, timeout)
        return transferred >= 0
    }

    private fun disconnectDevice() {
        usbDeviceConnection?.let {
            usbInterface?.let { intf -> it.releaseInterface(intf) }
            it.close()
        }
        usbDeviceConnection = null
        usbInterface = null
        usbEndpoint = null
        currentDevice = null
    }
}
