# API Reference: order_detail

Source file: `lib/driver/presentation/component/order_detail.dart`

## Classes

### class `OrderDetail`

## Whitelisted API Endpoints

### `OrderDetail({ super.key, this.isOrder = false, required this.order, this.isActiveButton = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ListView(physics: const BouncingScrollPhysics(), padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h), shrinkWrap: true, children: [ OrderItem(order: order, isSetCurrentOrder: isOrder && isActiveButton), isOrder ? Column( children: [ 16.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.orderInformation), onPressed: ()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(homeProvider).isLoading, title: AppHelpers.getTranslation( isOrder ? (order.status != "on_a_way" ? TrKeys.startShopping : TrKeys.completeCheckout) : TrKeys.order, ), onPressed: () async { if (order.deliveryman == null)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"), position: LatLng( double.parse( order .shop ?.location ?.latitude ?? "41.285127", ), double.parse( order .shop ?.location ?.longitude ?? "69.172530", ), ), icon: await image.resizeAndCircle( order.shop?.logoImg ?? "", 120, ), ), ); context.router.popUntilRoot(); }, ); } else { final ImageCropperMarker image = ImageCropperMarker(); if (order.status != "on_a_way")`
*No documentation provided (generation failed).*

### `MarkerId("Shop"), position: LatLng( double.parse( order.shop?.location?.latitude ?? "41.285127", ), double.parse( order.shop?.location?.longitude ?? "69.172530", ), ), icon: await image.resizeAndCircle( order.shop?.logoImg ?? "", 120, ), ), ); } else { ref .read(homeProvider.notifier) .getRoutingAll( context: context, start: LatLng( LocalStorage.getAddressSelected() ?.latitude ?? AppConstants.demoLatitude, LocalStorage.getAddressSelected() ?.longitude ?? AppConstants.demoLongitude, ), end: LatLng( double.parse( order.location?.latitude ?? "41.285127", ), double.parse( order.location?.longitude ?? "69.172530", ), ), market: Marker( markerId: const MarkerId("User"), position: LatLng( double.parse( order.location?.latitude ?? "41.285127", ), double.parse( order.location?.longitude ?? "69.172530", ), ), icon: await image.resizeAndCircle( order.user?.img ?? "", 120, ), ), ); } order.status != "on_a_way" ? ref .read(homeProvider.notifier) .goMarket( context: context, orderId: "", order: order, setOrder: !isActiveButton, onSuccess: ()`
*No documentation provided (generation failed).*
