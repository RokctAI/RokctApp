# API Reference: editable_food_stock_item

Source file: `lib/manager/presentation/component/list_items/editable_food_stock_item.dart`

## Classes

### class `EditableFoodStockItem`

## Whitelisted API Endpoints

### `Function(String) onPriceChange; final Function(String) onQuantityChange; final Function(String) onSkuChange; final Function() onDeleteStock; final bool isDeletable; final Function(BuildContext) onAddonTap; const EditableFoodStockItem({ super.key, required this.stock, required this.onPriceChange, required this.onQuantityChange, required this.onDeleteStock, required this.isDeletable, required this.onAddonTap, required this.onSkuChange, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(16.r), ), padding: REdgeInsets.symmetric(horizontal: 20, vertical: 16), margin: REdgeInsets.only(bottom: 8), child: Column( children: [ Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Expanded( child: UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.price)}*', inputType: TextInputType.number, textInputAction: TextInputAction.next, initialText: stock.price == null ? '' : stock.price.toString(), onChanged: onPriceChange, validator: AppValidators.emptyCheck, ), ), 10.horizontalSpace, Expanded( child: UnderlinedTextField( label: '${AppHelpers.getTranslation(TrKeys.quantity)}*', inputType: TextInputType.number, textInputAction: TextInputAction.next, initialText: stock.quantity == null ? '' : stock.quantity.toString(), onChanged: onQuantityChange, validator: AppValidators.emptyCheck, ), ), if (isDeletable) ButtonsBouncingEffect( child: GestureDetector( onTap: onDeleteStock, child: Container( width: 36.r, height: 36.r, margin: REdgeInsets.only(left: 10), decoration: BoxDecoration( borderRadius: BorderRadius.circular(6.r), color: AppStyle.textGrey, ), alignment: Alignment.center, child: Icon(FlutterRemix.delete_bin_line, size: 18.r), ), ), ), ], ), 4.verticalSpace, UnderlinedTextField( label: AppHelpers.getTranslation(TrKeys.sku), textInputAction: TextInputAction.next, initialText: stock.sku == null ? '' : stock.sku.toString(), onChanged: onSkuChange, ), if (stock.extras != null && (stock.extras?.isNotEmpty ?? false)) ListView.builder( shrinkWrap: true, itemCount: stock.extras?.length, physics: const NeverScrollableScrollPhysics(), padding: EdgeInsets.zero, itemBuilder: (context, index)`
*No documentation provided (generation failed).*
