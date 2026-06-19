// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:hardware_sdk/hardware_sdk.dart' as hw;

import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/core/utils/utils.dart';
import 'package:admin_desktop/src/models/data/order_data.dart';
import 'package:admin_desktop/src/models/data/addons_data.dart';
import '../../../../components/components.dart';

class PrintPage extends StatefulWidget {
  final OrderData? orderData;

  const PrintPage({super.key, required this.orderData});

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  var defaultPrinterType = hw.PrinterType.bluetooth;
  String customDivider = "-------------------------------------------";
  String customLine = "___________________________________________";
  String customSpace = "  ";
  var printerManager = hw.PrinterManager();
  var devices = <hw.PrinterDevice>[];

  String _ipAddress = '';
  String _port = '9100';
  final _ipController = TextEditingController();
  final _portController = TextEditingController();
  hw.PrinterDevice? selectedPrinter;

  @override
  void initState() {
    if (Platform.isWindows) defaultPrinterType = hw.PrinterType.usb;
    super.initState();
    _portController.text = _port;
    _scan();
  }

  @override
  void dispose() {
    _portController.dispose();
    _ipController.dispose();
    super.dispose();
  }

  // method to scan devices according PrinterType
  void _scan() async {
    devices.clear();
    setState(() {});
    try {
      final list = await printerManager.discoverPrinters();
      devices = list.where((d) => d.type == defaultPrinterType).toList();
      setState(() {});
    } catch (e) {
      log("Scan error: $e");
    }
  }

  void setPort(String value) {
    if (value.isEmpty) value = '9100';
    _port = value;
    var device = hw.PrinterDevice(
      name: "Network Printer ($_ipAddress:$value)",
      address: _ipAddress,
      type: hw.PrinterType.tcp,
    );
    selectDevice(device);
  }

  void setIpAddress(String value) {
    _ipAddress = value;
    var device = hw.PrinterDevice(
      name: "Network Printer ($value:$_port)",
      address: value,
      type: hw.PrinterType.tcp,
    );
    selectDevice(device);
  }

  void selectDevice(hw.PrinterDevice device) async {
    if (selectedPrinter != null) {
      if (device.address != selectedPrinter!.address) {
        await printerManager.disconnect();
      }
    }

    selectedPrinter = device;
    setState(() {});
  }

  Future _printReceiveTest() async {
    List<int> bytes = [];
    num subTotal = 0;
    subTotal = ((widget.orderData?.totalPrice ?? 0) -
        (widget.orderData?.tax ?? 0) -
        (widget.orderData?.deliveryFee ?? 0) +
        (widget.orderData?.totalDiscount ?? 0));

    // Xprinter XP-N160I
    final profile = await CapabilityProfile.load(name: 'XP-N160I');

    // PaperSize.mm80 or PaperSize.mm58
    final generator = Generator(PaperSize.mm80, profile);
    bytes += generator.setGlobalCodeTable('CP1252');
    bytes += generator.setStyles(const PosStyles(align: PosAlign.center));
    bytes += generator.text(
      AppHelpers.getTranslation(TrKeys.orderSummary),
      styles: const PosStyles(align: PosAlign.center, bold: true),
    );

    bytes += generator.text(
      "${AppHelpers.getTranslation(TrKeys.order)} #${AppHelpers.getTranslation(TrKeys.id)}${widget.orderData?.id}",
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.text(customDivider);
    bytes += generator.row([
      PosColumn(
        width: 7,
        text: customSpace + AppHelpers.getTranslation(TrKeys.shopName),
        styles: const PosStyles(align: PosAlign.left, codeTable: 'CP1252'),
      ),
      PosColumn(
        width: 5,
        text: widget.orderData?.shop?.translation?.title ?? "",
        styles: const PosStyles(align: PosAlign.right, codeTable: 'CP1252'),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.client),
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        width: 6,
        text:
            "${widget.orderData?.user?.firstname ?? ""} ${widget.orderData?.user?.lastname ?? ""}",
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.date),
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        width: 6,
        text: DateFormat(
          "MM/dd/yy HH:mm",
        ).format(widget.orderData?.createdAt?.toLocal() ?? DateTime.now()),
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.text(customLine);
    for (int index = 0;
        index < (widget.orderData?.details?.length ?? 0);
        index++) {
      bytes += generator.setStyles(const PosStyles(align: PosAlign.center));
      bytes += generator.row([
        PosColumn(
          width: 8,
          text:
              "$customSpace${widget.orderData?.details?[index].stock?.product?.translation?.title ?? ""} x ${widget.orderData?.details?[index].quantity ?? ""}",
          styles: const PosStyles(align: PosAlign.left, bold: true),
        ),
        PosColumn(
          width: 4,
          text: AppHelpers.numberFormat(
            widget.orderData?.details?[index].totalPrice ?? 0,
            symbol: widget.orderData?.currency?.symbol,
          ),
          styles: const PosStyles(align: PosAlign.right, bold: true),
        ),
      ]);
      for (int i = 0;
          i < (widget.orderData?.details?[index].addons?.length ?? 0);
          i++) {
        Addons addons = widget.orderData!.details![index].addons![i];
        bytes += generator.row([
          PosColumn(
            width: 10,
            text:
                "$customSpace${addons.stocks?.product?.translation?.title ?? ""} ( ${AppHelpers.numberFormat((addons.price ?? 0) / (addons.quantity ?? 1), symbol: widget.orderData?.currency?.symbol ?? "")} x ${(addons.quantity ?? 1)} )",
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            width: 2,
            text: "",
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }
      bytes += generator.setStyles(const PosStyles(align: PosAlign.center));
      bytes += generator.text(customDivider);
    }
    bytes += generator.text(customDivider);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.subtotal),
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        width: 6,
        text: AppHelpers.numberFormat(subTotal),
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.tax),
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        width: 6,
        text: AppHelpers.numberFormat(widget.orderData?.tax ?? 0),
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.deliveryFee),
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        width: 6,
        text: AppHelpers.numberFormat(widget.orderData?.deliveryFee ?? 0),
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.discount),
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        width: 6,
        text: AppHelpers.numberFormat(widget.orderData?.totalDiscount ?? 0),
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        width: 6,
        text: customSpace + AppHelpers.getTranslation(TrKeys.totalPrice),
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        width: 6,
        text: AppHelpers.numberFormat(widget.orderData?.totalPrice ?? 0),
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.text(customDivider);
    bytes += generator.text(AppHelpers.getTranslation(TrKeys.thankYou));

    _printEscPos(bytes, generator);
  }

  /// print ticket
  void _printEscPos(List<int> bytes, Generator generator) async {
    if (selectedPrinter == null) return;
    final printer = selectedPrinter!;

    final connResponse = await printerManager.connect(printer.address ?? "");
    if (!connResponse.success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(connResponse.error ?? "Failed to connect to printer")),
        );
      }
      return;
    }

    bytes += generator.feed(2);
    bytes += generator.cut();

    await printerManager.sendRawBytes(bytes);
    await printerManager.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<hw.PrinterType>(
            value: defaultPrinterType,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.print, size: 24),
              labelText: "Type Printer Device",
              labelStyle: TextStyle(fontSize: 18.0),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            items: <DropdownMenuItem<hw.PrinterType>>[
              if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)
                const DropdownMenuItem(
                  value: hw.PrinterType.bluetooth,
                  child: Text("bluetooth"),
                ),
              if (Platform.isAndroid || Platform.isWindows)
                const DropdownMenuItem(
                  value: hw.PrinterType.usb,
                  child: Text("usb"),
                ),
              const DropdownMenuItem(
                value: hw.PrinterType.tcp,
                child: Text("Wifi"),
              ),
            ],
            onChanged: (hw.PrinterType? value) {
              if (value != null) {
                setState(() {
                  defaultPrinterType = value;
                  selectedPrinter = null;
                  _scan();
                });
              }
            },
          ),
          Column(
            children: devices
                .map(
                  (device) => ListTile(
                    title: Text(device.name),
                    subtitle: Platform.isAndroid &&
                            defaultPrinterType == hw.PrinterType.usb
                        ? null
                        : Visibility(
                            visible: !Platform.isWindows,
                            child: Text(device.address ?? ""),
                          ),
                    onTap: () => selectDevice(device),
                    leading: selectedPrinter != null &&
                            selectedPrinter!.address == device.address
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    trailing: OutlinedButton(
                      onPressed: selectedPrinter == null ||
                              device.address != selectedPrinter?.address
                          ? null
                          : () async {
                              _printReceiveTest();
                            },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Print test ticket",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Visibility(
            visible:
                defaultPrinterType == hw.PrinterType.tcp && Platform.isWindows,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _ipController,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                ),
                decoration: const InputDecoration(
                  label: Text("Ip Address"),
                  prefixIcon: Icon(Icons.wifi, size: 24),
                ),
                onChanged: setIpAddress,
              ),
            ),
          ),
          Visibility(
            visible:
                defaultPrinterType == hw.PrinterType.tcp && Platform.isWindows,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: _portController,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                ),
                decoration: const InputDecoration(
                  label: Text("Port"),
                  prefixIcon: Icon(Icons.numbers_outlined, size: 24),
                ),
                onChanged: setPort,
              ),
            ),
          ),
          Visibility(
            visible:
                defaultPrinterType == hw.PrinterType.tcp && Platform.isWindows,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ConfirmButton(
                paddingSize: 32,
                onTap: () async {
                  _printReceiveTest();
                },
                title: "Print",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
