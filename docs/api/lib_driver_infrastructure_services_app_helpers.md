# API Reference: app_helpers

Source file: `lib/driver/infrastructure/services/app_helpers.dart`

## Classes

### class `AppHelpers`

## Whitelisted API Endpoints

### `numberFormat({ num? number, String? symbol, bool? isOrder, int? maxLength, })`
*No documentation provided (generation failed).*

### `getAuthOption()`
*No documentation provided (generation failed).*

### `getAppName()`
*No documentation provided (generation failed).*

### `getDriverCantEdit()`
*No documentation provided (generation failed).*

### `getAppDeliveryTime()`
*No documentation provided (generation failed).*

### `checkIsSvg(String? url)`
*No documentation provided (generation failed).*

### `showNoConnectionSnackBar(BuildContext context)`
*No documentation provided (generation failed).*

### `Duration(seconds: 3), content: Text( 'No internet connection', style: GoogleFonts.inter( fontSize: 14, fontWeight: FontWeight.w600, color: AppStyle.white, ), ), action: SnackBarAction( label: 'Close', disabledTextColor: Colors.white, textColor: Colors.yellow, onPressed: ()`
*No documentation provided (generation failed).*

### `showCheckTopSnackBar(BuildContext context, String text)`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.error( message: text.isNotEmpty ? text : " Please check your credentials and try again", ), ); } static void showCheckTopSnackBarInfo(BuildContext context, String text)`
*No documentation provided (generation failed).*

### `showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: text), ); } static String getTranslation(String trKey)`
*No documentation provided (generation failed).*

### `getTranslationReverse(String trKey)`
*No documentation provided (generation failed).*

### `showCustomModalBottomSheet({ required BuildContext context, required Widget modal, required bool isDarkMode, double radius = 16, bool isDrag = true, bool isExpanded = false, double paddingTop = 200, bool isDismissible = true, })`
*No documentation provided (generation failed).*

### `BlurWrap(radius: BorderRadius.only( topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r), ), child: Container( margin: EdgeInsets.only( bottom: MediaQuery.viewInsetsOf(context).bottom, ), padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom, ), decoration: BoxDecoration( color: AppStyle.white.withValues(alpha: 0.9), borderRadius: BorderRadius.only( topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r), ), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.25), blurRadius: 40, spreadRadius: 0, offset: const Offset(0, -2), ), ], ), child: SingleChildScrollView( child: Column( mainAxisSize: MainAxisSize.min, children: [ Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), margin: EdgeInsets.only(top: 8.h, bottom: 16.h), ), modal, ], ), ), ), ), ); } static void showCustomModalBottomSheetWithoutIosIcon({ required BuildContext context, required Widget modal, required bool isDarkMode, double radius = 16, bool isDrag = true, double paddingTop = 200, })`
*No documentation provided (generation failed).*

### `showAlertDialog({ required BuildContext context, required Widget child, double radius = 16, })`
*No documentation provided (generation failed).*

### `getBytesFromAsset(String path, int width) async { ByteData data = await rootBundle.load(path); ui.Codec codec = await ui.instantiateImageCodec( data.buffer.asUint8List(), targetWidth: width, ); ui.FrameInfo fi = await codec.getNextFrame(); return (await fi.image.toByteData( format: ui.ImageByteFormat.png, ))!.buffer.asUint8List(); } static Future<Uint8List> svgToPng( String svgString, { int? svgWidth, int? svgHeight, }) async { final PictureInfo pictureInfo = await vg.loadPicture( SvgAssetLoader(svgString), null, ); final image = await pictureInfo.picture.toImage( svgWidth ?? pictureInfo.size.width.toInt(), svgHeight ?? pictureInfo.size.height.toInt(), ); ByteData? bytes = await image.toByteData(format: ImageByteFormat.png); return bytes!.buffer.asUint8List(); } static String errorHandler(dynamic e)`
*No documentation provided (generation failed).*

### `openDialogImagePicker({ required BuildContext context, required ValueChanged<String> onSuccess, })`
*No documentation provided (generation failed).*

### `showDialog(context: context, builder: (_)`
*No documentation provided (generation failed).*

### `Builder(builder: (colors)`
*No documentation provided (generation failed).*

### `Dialog(backgroundColor: AppStyle.transparent, insetPadding: EdgeInsets.symmetric(horizontal: 16.w), child: Container( margin: EdgeInsets.all(24.w), width: double.infinity, padding: EdgeInsets.all(24.w), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(16.r), ), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [ Text( AppHelpers.getTranslation(TrKeys.selectPhoto), textAlign: TextAlign.center, style: AppStyle.interNormal(size: 18), ), const Divider(), 8.verticalSpace, ButtonsBouncingEffect( child: GestureDetector( onTap: () => ImgService.getPhotoCamera(onSuccess), child: Padding( padding: EdgeInsets.symmetric( horizontal: 16.r, vertical: 8.r, ), child: Row( children: [ const Icon(FlutterRemix.camera_lens_line), 4.horizontalSpace, Text( AppHelpers.getTranslation(TrKeys.takePhoto), textAlign: TextAlign.center, style: AppStyle.interNormal(size: 16), ), ], ), ), ), ), 8.verticalSpace, ButtonsBouncingEffect( child: GestureDetector( onTap: () => ImgService.getPhotoGallery(onSuccess), child: Padding( padding: EdgeInsets.symmetric( horizontal: 16.r, vertical: 8.r, ), child: Row( children: [ const Icon(FlutterRemix.gallery_line), 4.horizontalSpace, Text( AppHelpers.getTranslation( TrKeys.chooseFromLibrary, ), textAlign: TextAlign.center, style: AppStyle.interNormal(size: 16), ), ], ), ), ), ), 12.verticalSpace, CustomButton( background: AppStyle.shimmerBase, title: AppHelpers.getTranslation(TrKeys.skip), onPressed: ()`
*No documentation provided (generation failed).*
