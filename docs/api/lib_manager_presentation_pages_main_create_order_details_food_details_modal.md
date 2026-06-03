# API Reference: food_details_modal

Source file: `lib/manager/presentation/pages/main/create_order/details/food_details_modal.dart`

## Classes

### class `FoodDetailsModal`

## Whitelisted API Endpoints

### `FoodDetailsModal({ super.key, required this.product, required this.controller, }); @override ConsumerState<FoodDetailsModal> createState() => _FoodDetailsModalState(); } class _FoodDetailsModalState extends ConsumerState<FoodDetailsModal> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: SingleChildScrollView( controller: widget.controller, physics: const BouncingScrollPhysics(), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ const ModalDrag(), CommonImage( url: widget.product.img, radius: 16, errorRadius: 16, fit: BoxFit.fitWidth, height: 212, width: double.infinity, ), 22.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Expanded( child: Text( widget.product.translation?.title ?? '', style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), ), FoodPriceWidget( product: widget.product, stock: state.selectedStock, ), ], ), 6.verticalSpace, Text( '${widget.product.translation?.description}', style: AppStyle.interNormal( size: 12, color: AppStyle.text, letterSpacing: -0.3, ), ), 24.verticalSpace, if (ref.watch(productsProvider).typedExtras.isNotEmpty) Padding( padding: REdgeInsets.only(bottom: 24), child: const FoodExtras(), ), WIngredientScreen( list: state.selectedStock?.addons ?? [], onChange: (int value)`
*No documentation provided (generation failed).*
