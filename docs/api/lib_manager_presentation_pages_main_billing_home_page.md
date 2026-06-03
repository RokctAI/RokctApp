# API Reference: home_page

Source file: `lib/manager/presentation/pages/main/billing/home_page.dart`

## Classes

### class `ManagerBillingPage`

## Whitelisted API Endpoints

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.bgGray, body: Column( children: [ Container( height: 300.h, width: double.infinity, decoration: BoxDecoration( color: AppStyle.black, borderRadius: BorderRadius.only( bottomLeft: Radius.circular(24.r), bottomRight: Radius.circular(24.r), ), ), child: ClipRRect( borderRadius: BorderRadius.only( bottomLeft: Radius.circular(24.r), bottomRight: Radius.circular(24.r), ), child: MobileScanner( controller: scannerController, onDetect: (capture)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.only(bottom: 12.r), padding: EdgeInsets.all(12.r), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(12.r), boxShadow: [ BoxShadow( color: AppStyle.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4), ), ], ), child: Row( children: [ CommonImage( url: item.product?.img, width: 50.w, height: 50.h, radius: 8.r, ), 12.horizontalSpace, Expanded( child: Column( crossorigin: CrossAxisAlignment.start, children: [ Text( item.product?.translation?.title ?? '', style: AppStyle.interSemi(size: 14.sp), ), Text( '${item.totalPrice} x ${item.cartCount}', style: AppStyle.interRegular( size: 12.sp, color: AppStyle.hintColor, ), ), ], ), ), IconButton( onPressed: () => ref .read(orderCartProvider.notifier) .deleteStockFromCart(stock: item), icon: const Icon( Icons.delete_outline, color: AppStyle.red, ), ), ], ), ); }, ), ), if (cartState.stocks.isNotEmpty) Container( padding: EdgeInsets.all(24.r), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.only( topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r), ), boxShadow: [ BoxShadow( color: AppStyle.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5), ), ], ), child: Column( mainAxisSize: MainAxisSize.min, children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text( AppHelpers.getTranslation(TrKeys.total), style: AppStyle.interSemi(size: 16.sp), ), Text( AppHelpers.numberFormat(num: cartState.totalPrice), style: AppStyle.interBold( size: 18.sp, color: AppStyle.blue, ), ), ], ), 20.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.continueText), onPressed: ()`
*No documentation provided (generation failed).*
