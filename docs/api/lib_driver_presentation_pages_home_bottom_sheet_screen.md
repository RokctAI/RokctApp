# API Reference: bottom_sheet_screen

Source file: `lib/driver/presentation/pages/home/bottom_sheet_screen.dart`

## Classes

### class `BottomSheetScreen`

## Whitelisted API Endpoints

### `BottomSheetScreen({super.key, required this.isScrolling}); @override State<BottomSheetScreen> createState() => _BottomSheetScreenState(); } class _BottomSheetScreenState extends State<BottomSheetScreen> { final List<String> image = [ "https://www.deliveryhero.com/wp-content/uploads/2021/01/TAR_5922.jpg", 'https://images.ctfassets.net/trvmqu12jq2l/1LFP1rAaPMiEx5y11ZZv2F/5167948e81a58a08e516631e07ee154c/blog-hero-1208x1080-v115.14.01.jpg', 'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFja2FnZSUyMGRlbGl2ZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80', ]; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `AnimatedPositioned(bottom: widget.isScrolling ? -280.h : 0, duration: const Duration(milliseconds: 400), child: Container( height: 336.h, width: MediaQuery.sizeOf(context).width, decoration: BoxDecoration( color: AppStyle.textGrey, borderRadius: BorderRadius.only( topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r), ), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.25), blurRadius: 40, offset: const Offset(0, -2), ), ], ), padding: EdgeInsets.only( top: 8.h, bottom: MediaQuery.paddingOf(context).bottom + 16.h, left: 16.w, right: 16.w, ), child: Column( children: [ Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), Column( children: [ 18.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_balance(context), _benefit(context)], ), SizedBox( height: 186.h, child: ListView.builder( padding: EdgeInsets.only(top: 24.h), scrollDirection: Axis.horizontal, itemCount: 3, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `StoresPage(image: image[index]); }, ), ), ], ), ], ), ), ); } Widget _benefit(BuildContext context)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(shape: BoxShape.circle, color: AppStyle.black, ), child: Icon( FlutterRemix.file_list_2_fill, color: AppStyle.primary, ), ), 14.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ 4.verticalSpace, SizedBox( width: 60.w, child: Text( AppHelpers.getTranslation(TrKeys.foodymanBenefit), style: AppStyle.interNormal( size: 12.sp, letterSpacing: -0.3, ), maxLines: 1, ), ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Text(AppHelpers.numberFormat( number: (ref .watch(profileSettingsProvider) .statistics ?.data ?.totalPrice ?? 0), ), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), ); }, ), ], ), ], ), ), ); } Widget _balance(BuildContext context)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*
