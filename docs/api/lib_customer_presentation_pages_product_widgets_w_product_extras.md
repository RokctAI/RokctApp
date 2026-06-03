# API Reference: w_product_extras

Source file: `lib/customer/presentation/pages/product/widgets/w_product_extras.dart`

## Classes

### class `WProductExtras`

## Whitelisted API Endpoints

### `WProductExtras({super.key}); @override Widget build(BuildContext context, WidgetRef ref)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(width: double.infinity, decoration: BoxDecoration( color: state.typedExtras.isEmpty ? AppStyle.transparent : colors.textWhite, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.all(18), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ ListView.builder( physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.typedExtras.length, padding: EdgeInsets.zero, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: colors.textWhite, ), padding: REdgeInsets.symmetric( horizontal: 12, vertical: 14, ), margin: REdgeInsets.only(bottom: 14), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( typedExtra.title, style: AppStyle.interNoSemi( size: 16, color: colors.textBlack, letterSpacing: -0.4, ), ), 16.verticalSpace, typedExtra.type == ExtrasType.text ? TextExtras( uiExtras: typedExtra.uiExtras, groupIndex: typedExtra.groupIndex, onUpdate: (uiExtra)`
*No documentation provided (generation failed).*
