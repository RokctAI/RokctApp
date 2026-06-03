# API Reference: app_helpers

Source file: `lib/manager/infrastructure/services/app_helpers.dart`

## Classes

### class `AppHelpers`

## Whitelisted API Endpoints

### `openDialog({ required BuildContext context, required String title, })`
*No documentation provided (generation failed).*

### `showDialog(context: context, builder: (_)`
*No documentation provided (generation failed).*

### `Dialog(backgroundColor: AppStyle.transparent, insetPadding: EdgeInsets.symmetric(horizontal: 16.w), child: Container( margin: EdgeInsets.all(24.w), width: double.infinity, padding: EdgeInsets.all(24.w), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(24.r), ), child: SingleChildScrollView( child: Column( children: [ Text( getTranslation(title), textAlign: TextAlign.center, style: AppStyle.interNormal(size: 18), ), 24.verticalSpace, CustomButton( onPressed: () => Navigator.pop(context), title: getTranslation(TrKeys.close), ), ], ), ), ), ); }, ); } static void errorSnackBar(BuildContext context, {String? text})`
*No documentation provided (generation failed).*

### `cartesian(List<List<Dyn>> args)`
*No documentation provided (generation failed).*

### `helper(List<Extras> arr, int i)`
*No documentation provided (generation failed).*

### `numberFormat(num? number, {String? symbol, int? maxLength})`
*No documentation provided (generation failed).*

### `getAuthOption()`
*No documentation provided (generation failed).*

### `getInitialAddonQuantity(ProductData addon)`
*No documentation provided (generation failed).*

### `getInitialAddonPrice(ProductData addon)`
*No documentation provided (generation failed).*

### `truncate(String value, int length)`
*No documentation provided (generation failed).*

### `getShopWorkingTimeForToday()`
*No documentation provided (generation failed).*

### `getTranslation(TrKeys.theRestaurantIsClosedToday); } final currentWeekday = DateFormat( 'EEEE', ).format(DateTime.now()).toLowerCase(); final List<ShopWorkingDays> workingDays = shop.shopWorkingDays ?? []; for (final day in workingDays)`
*No documentation provided (generation failed).*

### `getTranslation(TrKeys.theRestaurantIsClosedToday); } return '${day.from?.substring(0, 2)}:${day.from?.substring(3, 5)} - ${day.to?.substring(0, 2)}:${day.to?.substring(3, 5)}'; } } return ''; } static double? getInitialLatitude()`
*No documentation provided (generation failed).*

### `getExtraTypeByValue(String? value)`
*No documentation provided (generation failed).*

### `getUpdatableStatus(String? value)`
*No documentation provided (generation failed).*

### `changeStatusButtonText(String? value)`
*No documentation provided (generation failed).*

### `getTranslation(TrKeys.swipeToAccept); case 'accepted': return getTranslation(TrKeys.swipeToCooking); case 'cooking': return getTranslation(TrKeys.swipeToReady); case 'ready': return getTranslation(TrKeys.swipeToWay); case 'on_a_way': return getTranslation(TrKeys.swipeToDelivered); case 'delivered': return getTranslation(TrKeys.swipeToAccept); case 'canceled': return getTranslation(TrKeys.swipeToAccept); default: return getTranslation(TrKeys.swipeToAccept); } } static OrderStatus getOrderStatus(String? value)`
*No documentation provided (generation failed).*

### `showPopup({ required BuildContext context, required Iterable<PopupMenuItem> items, double radius = AppConstants.radius, bool isRight = false, })`
*No documentation provided (generation failed).*

### `checkIsSvg(String? url)`
*No documentation provided (generation failed).*

### `getAppName()`
*No documentation provided (generation failed).*

### `showNoConnectionSnackBar(BuildContext context)`
*No documentation provided (generation failed).*

### `Duration(seconds: 3), content: Text( 'No internet connection', style: GoogleFonts.inter( fontSize: 14, fontWeight: FontWeight.w600, color: AppStyle.white, ), ), action: SnackBarAction( label: 'Close', disabledTextColor: Colors.white, textColor: Colors.yellow, onPressed: ()`
*No documentation provided (generation failed).*

### `showCheckTopSnackBar(BuildContext context, { String? text, SnackBarType? type, })`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), type == SnackBarType.error ? CustomSnackBar.error( message: text ?? AppHelpers.getTranslation( TrKeys.somethingWentWrongWithTheServer, ), ) : (type == SnackBarType.success ? CustomSnackBar.success( message: text ?? AppHelpers.getTranslation(TrKeys.successfullyCompleted), ) : CustomSnackBar.info( message: text ?? AppHelpers.getTranslation(TrKeys.infoMessage), )), ); } static String getTranslation(String trKey)`
*No documentation provided (generation failed).*

### `showCustomModalBottomSheet({ required BuildContext context, required Widget modal, required bool isDarkMode, double radius = 16, bool isDrag = true, bool isDismissible = true, double paddingTop = 200, })`
*No documentation provided (generation failed).*

### `Padding(padding: MediaQuery.of(context).viewInsets, child: modal), ); } static void showCustomModalBottomDragSheet({ required BuildContext context, required Function(ScrollController controller) modal, double radius = 16, bool isDrag = true, bool isDismissible = true, double paddingTop = 100, double maxChildSize = 0.9, double initSize = 0.9, })`
*No documentation provided (generation failed).*

### `DraggableScrollableSheet(initialChildSize: initSize, maxChildSize: maxChildSize, expand: false, builder: (BuildContext context, ScrollController scrollController)`
*No documentation provided (generation failed).*

### `modal(scrollController); }, ), ); } static void showCustomModalBottomSheetWithoutIosIcon({ required BuildContext context, required Widget modal, required bool isDarkMode, double radius = 16, bool isDrag = true, double paddingTop = 200, })`
*No documentation provided (generation failed).*

### `showAlertDialog({ required BuildContext context, required Widget child, double radius = 16, })`
*No documentation provided (generation failed).*

### `AlertDialog(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(radius.r), ), contentPadding: EdgeInsets.all(16.r), iconPadding: EdgeInsets.zero, content: child, ); }, ); } static String errorHandler(dynamic e)`
*No documentation provided (generation failed).*
