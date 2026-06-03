# API Reference: app_helpers

Source file: `lib/core/infrastructure/utils/app_helpers.dart`

## Classes

### class `AppHelpers`

## Whitelisted API Endpoints

### `numberFormat(num? number, {String? symbol, bool? isOrder})`
*No documentation provided (generation failed).*

### `getAuthOption()`
*No documentation provided (generation failed).*

### `getSocialAuth()`
*No documentation provided (generation failed).*

### `generateNonce([int length = 32])`
*No documentation provided (generation failed).*

### `checkYesterday(String? startTime, String? endTime)`
*No documentation provided (generation failed).*

### `Duration(days: 1)); final format = DateFormat('HH:mm'); DateTime start = format.parse(startTime.toSingleTime); DateTime end = format.parse(endTime.toSingleTime); start = DateTime( now.year, now.month, now.day, start.hour, start.minute, start.second, ); end = DateTime( now.year, now.month, now.day, end.hour, end.minute, end.second, ); return end.isBefore(start); } static void showNoConnectionSnackBar(BuildContext context)`
*No documentation provided (generation failed).*

### `Duration(seconds: 3), content: Text( 'No internet connection', style: AppStyle.interNoSemi(size: 14, color: AppStyle.white), ), action: SnackBarAction( label: 'Close', disabledTextColor: AppStyle.black, textColor: AppStyle.black, onPressed: ()`
*No documentation provided (generation failed).*

### `getExtraTypeByValue(String? value)`
*No documentation provided (generation failed).*

### `getOrderStatus(String? value)`
*No documentation provided (generation failed).*

### `getOrderStatusText(OrderStatus value)`
*No documentation provided (generation failed).*

### `showCheckTopSnackBar(BuildContext context, String text)`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.error( message: text.isEmpty ? "Please check your credentials and try again" : text, ), animationDuration: const Duration(milliseconds: 700), reverseAnimationDuration: const Duration(milliseconds: 700), displayDuration: const Duration(milliseconds: 700), ); } static void showCheckTopSnackBarInfo( BuildContext context, String text, { VoidCallback? onTap, })`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: text), animationDuration: const Duration(milliseconds: 700), reverseAnimationDuration: const Duration(milliseconds: 700), displayDuration: const Duration(milliseconds: 700), onTap: onTap, ); } static void showCheckTopSnackBarDone(BuildContext context, String text)`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: text), animationDuration: const Duration(milliseconds: 700), reverseAnimationDuration: const Duration(milliseconds: 700), displayDuration: const Duration(milliseconds: 700), ); } static void showCheckTopSnackBarInfoCustom( BuildContext context, String text, { VoidCallback? onTap, })`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.info( message: text, icon: const SizedBox.shrink(), backgroundColor: AppStyle.primary, textStyle: AppStyle.interNormal(), ), animationDuration: const Duration(milliseconds: 700), reverseAnimationDuration: const Duration(milliseconds: 700), displayDuration: const Duration(milliseconds: 700), onTap: onTap, ); } static double getOrderStatusProgress(String? status)`
*No documentation provided (generation failed).*

### `getType()`
*No documentation provided (generation failed).*

### `getGroupOrder()`
*No documentation provided (generation failed).*

### `getParcel()`
*No documentation provided (generation failed).*

### `getReferralActive()`
*No documentation provided (generation failed).*

### `getPhoneRequired()`
*No documentation provided (generation failed).*

### `getReservationEnable()`
*No documentation provided (generation failed).*

### `getTranslation(String trKey)`
*No documentation provided (generation failed).*

### `getTranslationReverse(String trKey)`
*No documentation provided (generation failed).*

### `formatAddress(Placemark p)`
*No documentation provided (generation failed).*

### `Function(ScrollController controller) modal, bool isDarkMode = false, double radius = 16, bool isDrag = true, bool isDismissible = true, double paddingTop = 100, double maxChildSize = 0.9, })`
Extracts house/building number from Placemark
Returns the house number or empty string if not found
static String extractHouseNumber(Placemark p) {
if (p.subThoroughfare != null && p.subThoroughfare!.isNotEmpty) {
return p.subThoroughfare!;
}
if (p.street != null && p.street!.isNotEmpty) {
final match = RegExp(r'\b(\d+[A-Za-z]?)\b').firstMatch(p.street!);
if (match != null) {
return match.group(1) ?? '';
}
}
if (p.name != null && p.name!.isNotEmpty) {
final match = RegExp(r'\b(\d+[A-Za-z]?)\b').firstMatch(p.name!);
if (match != null) {
return match.group(1) ?? '';
}
}
return '';
}
Gets detailed address information from Placemark
Returns a map with separate fields
static Map<String, String> getDetailedAddress(Placemark p) {
return {
'street': p.thoroughfare ?? p.street ?? '',
'houseNumber': extractHouseNumber(p),
'district': p.subLocality ?? '',
'city': p.locality ?? '',
'region': p.administrativeArea ?? '',
'country': p.country ?? '',
'postalCode': p.postalCode ?? '',
'fullAddress': formatAddress(p),
};
}
static bool checkIsSvg(String? url) {
if (url == null || (url.length) < 3) {
return false;
}
final length = url.length;
return url.substring(length - 3, length) == 'svg';
}
static double? getInitialLatitude() {
final List<SettingsData> settings = LocalStorage.getSettingsList();
for (final setting in settings) {
if (setting.key == 'location') {
final String? latString = setting.value?.substring(
0,
setting.value?.indexOf(','),
);
if (latString == null) {
return null;
}
final double? lat = double.tryParse(latString);
return lat;
}
}
return null;
}
static double? getInitialLongitude() {
final List<SettingsData> settings = LocalStorage.getSettingsList();
for (final setting in settings) {
if (setting.key == 'location') {
final String? latString = setting.value?.substring(
0,
setting.value?.indexOf(','),
);
if (latString == null) {
return null;
}
final String? lonString = setting.value?.substring(
(latString.length) + 2,
setting.value?.length,
);
if (lonString == null) {
return null;
}
final double? lon = double.tryParse(lonString);
return lon;
}
}
return null;
}
static void showCustomModalBottomSheet({
required BuildContext context,
required Widget modal,
required bool isDarkMode,
double radius = 16,
bool isDrag = true,
bool isDismissible = true,
double paddingTop = 200,
Color? backgroundColor,
}) {
showModalBottomSheet(
isDismissible: isDismissible,
enableDrag: isDrag,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.only(
topLeft: Radius.circular(radius.r),
topRight: Radius.circular(radius.r),
),
),
isScrollControlled: true,
constraints: BoxConstraints(
maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
),
backgroundColor: backgroundColor,
context: context,
builder: (context) => modal,
);
}
static void showCustomModalBottomDragSheet({
required BuildContext context,

### `DraggableScrollableSheet(initialChildSize: maxChildSize, maxChildSize: maxChildSize, expand: false, builder: (BuildContext context, ScrollController scrollController)`
*No documentation provided (generation failed).*

### `modal(scrollController); }, ), ); } static void showAlertDialog({ required BuildContext context, required Widget child, Color? backgroundColor, double radius = 16, })`
*No documentation provided (generation failed).*

### `errorHandler(dynamic e)`
*No documentation provided (generation failed).*

### `plusMinutes({required int minute})`
*No documentation provided (generation failed).*

### `Function(E e, int i) f)`
*No documentation provided (generation failed).*
