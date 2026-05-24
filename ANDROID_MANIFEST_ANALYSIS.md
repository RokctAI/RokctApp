# AndroidManifest Analysis for Role-Specific Permissions

## Overview
Analysis of AndroidManifest.xml files for customer, driver, manager roles and RokctApp to identify missing permissions for proper functionality, particularly focusing on background operations needed for offline-first capabilities.

## Permission Comparison

### Customer App (`paas_customer\android\app\src\main\AndroidManifest.xml`)
**Has Permissions:**
- `android.permission.INTERNET`
- `android.permission.VIBRATE`
- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.ACCESS_COARSE_LOCATION`
- `android.permission.READ_EXTERNAL_STORAGE`

**Missing Permissions:**
- `android.permission.ACCESS_BACKGROUND_LOCATION`
- `android.permission.FOREGROUND_SERVICE`
- `android.permission.WAKE_LOCK`
- `android.permission.ACCESS_NETWORK_STATE`

### Driver App (`paas_driver\android\app\src\main\AndroidManifest.xml`)
**Has Permissions:**
- `android.permission.INTERNET`
- `android.permission.ACCESS_NETWORK_STATE`
- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.ACCESS_COARSE_LOCATION`
- `android.permission.ACCESS_BACKGROUND_LOCATION`
- `android.permission.FOREGROUND_SERVICE`
- `android.permission.WAKE_LOCK`

**Missing Permissions:**
- `android.permission.VIBRATE`
- `android.permission.READ_EXTERNAL_STORAGE`

### Manager App (`paas_manager\android\app\src\main\AndroidManifest.xml`)
**Has Permissions:**
- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.ACCESS_COARSE_LOCATION`
- `android.permission.INTERNET`
- `android.permission.ACCESS_NETWORK_STATE`

**Missing Permissions:**
- `android.permission.VIBRATE`
- `android.permission.READ_EXTERNAL_STORAGE`
- `android.permission.ACCESS_BACKGROUND_LOCATION`
- `android.permission.FOREGROUND_SERVICE`
- `android.permission.WAKE_LOCK`

### RokctApp (`RokctApp\android\app\src\main\AndroidManifest.xml`)
**Has Permissions:**
- `android.permission.INTERNET`
- `android.permission.VIBRATE`
- `android.permission.ACCESS_FINE_LOCATION`
- `android.permission.ACCESS_COARSE_LOCATION`
- `android.permission.READ_EXTERNAL_STORAGE`

**Missing Permissions:**
- `android.permission.ACCESS_BACKGROUND_LOCATION`
- `android.permission.FOREGROUND_SERVICE`
- `android.permission.WAKE_LOCK`
- `android.permission.ACCESS_NETWORK_STATE`

## Queries Analysis
- **Customer & RokctApp:** Have rich queries including `PROCESS_TEXT`, SMS, tel, and CustomTabsService
- **Driver & Manager:** Have basic queries for SMS and tel support only

## Critical Missing Permissions for Background Location Tracking
Based on Spazafy's implementation which uses Workmanager for periodic location updates, the **Driver role** specifically needs these permissions for proper background operation:

1. **`ACCESS_BACKGROUND_LOCATION`** - Required for Android 10+ to access location when app is in background
2. **`FOREGROUND_SERVICE`** - Required to run location updates as a foreground service (prevents killing)
3. **`WAKE_LOCK`** - Prevents device from sleeping during background operations
4. **`ACCESS_NETWORK_STATE`** - Allows checking connectivity before making API calls

## Recommendations

### For Driver Role (High Priority - Background Location Tracking)
Add to `paas_driver\android\app\src\main\AndroidManifest.xml`:
```xml
<!-- Already has most needed permissions -->
<!-- Consider adding: -->
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

### For RokctApp (To Match Driver Background Capabilities)
Add to `RokctApp\android\app\src\main\AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

### For Customer & Manager Roles
Consider adding based on actual background work requirements:
- `ACCESS_NETWORK_STATE` - For connectivity-aware operations
- `FOREGROUND_SERVICE` & `WAKE_LOCK` - If implementing background sync
- `ACCESS_BACKGROUND_LOCATION` - Only if needing background location tracking

## Implementation Notes
1. **Android 10+ Background Location:** `ACCESS_BACKGROUND_LOCATION` is required alongside `ACCESS_FINE_LOCATION`/`ACCESS_COARSE_LOCATION` for background access
2. **Foreground Service:** Location updates should run as a foreground service with persistent notification for user awareness
3. **Battery Optimization:** Consider adding `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` for critical background tasks
4. **Runtime Permissions:** Remember that dangerous permissions (location, storage) still require runtime requests even when declared in manifest

These permissions are essential for the Workmanager-based background location tracking implemented in Spazafy to function correctly in the driver role of RokctApp.