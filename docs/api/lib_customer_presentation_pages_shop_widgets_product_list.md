# API Reference: product_list

Source file: `lib/customer/presentation/pages/shop/widgets/product_list.dart`

## Classes

### class `ProductsList`

## Whitelisted API Endpoints

### `search(ShopState state)`
*No documentation provided (generation failed).*

### `where((element)`
*No documentation provided (generation failed).*

### `category(int id)`
*No documentation provided (generation failed).*

### `where((element)`
*No documentation provided (generation failed).*

### `ProductsList({super.key, this.cartId, this.all, required this.shopId}); @override ConsumerState<ProductsList> createState() => _ProductsListState(); } class _ProductsListState extends ConsumerState<ProductsList> { @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `SingleChildScrollView(physics: const NeverScrollableScrollPhysics(), child: (widget.all?.products?.search(state).isNotEmpty ?? false) && widget.all?.translation?.title == AppHelpers.getTranslation(TrKeys.popular) && state.searchText.isNotEmpty ? const SizedBox.shrink() : Column( children: [ if ((widget.all?.products?.search(state).isNotEmpty ?? false) && (widget.all?.products?.isNotEmpty ?? false)) Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ 12.verticalSpace, TitleAndIcon(title: widget.all?.translation?.title ?? ""), ], ), if ((widget.all?.products?.search(state).isNotEmpty ?? false) && (widget.all?.products?.isNotEmpty ?? false)) 12.verticalSpace, ((widget.all?.products?.search(state).isNotEmpty ?? false) && (widget.all?.products?.isNotEmpty ?? false)) ? AnimationLimiter( child: GridView.builder( padding: EdgeInsets.only( right: 12.w, left: 12.w, bottom: 12.h, ), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( childAspectRatio: 0.66.r, crossAxisCount: 2, mainAxisExtent: 250.r, ), itemCount: widget.all?.products?.search(state).length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: ScaleAnimation( scale: 0.5, child: FadeInAnimation( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `ProductScreen(cartId: widget.cartId, data: ProductData.fromJson( widget.all?.products ?.search(state)[index] .toJson(), ), controller: c, ), isDarkMode: false, isDrag: true, radius: 16, ); }, child: ShopProductItem( product: (widget.all?.products?.search( state, ) ?? []) .toList()[index], ), ), ), ), ); }, ), ) : const SizedBox.shrink(), ], ), ); } Widget resultEmpty(CustomColorSet colors)`
*No documentation provided (generation failed).*
