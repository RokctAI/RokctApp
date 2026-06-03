# API Reference: select_address_item

Source file: `lib/customer/presentation/components/select_address_item.dart`

## Classes

### class `SelectAddressItem`

## Whitelisted API Endpoints

### `SelectAddressItem({ super.key, required this.onTap, required this.isActive, required this.address, required this.update, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.only(bottom: 8.h), child: GestureDetector( onTap: onTap, child: Container( width: double.infinity, decoration: BoxDecoration( color: colors.icon, borderRadius: BorderRadius.circular(10.r), ), child: Padding( padding: EdgeInsets.all(18.r), child: Row( crossAxisAlignment: CrossAxisAlignment.center, children: [ AnimatedContainer( duration: const Duration(milliseconds: 500), width: 18.w, height: 18.h, decoration: BoxDecoration( color: isActive ? colors.primary : AppStyle.transparent, shape: BoxShape.circle, border: Border.all( color: AppStyle.textGrey, width: isActive ? 4.r : 2.r, ), ), ), 16.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ SizedBox( width: MediaQuery.sizeOf(context).width - 150.r, child: Text( address?.title ?? address?.address?.address ?? "", style: AppStyle.interNormal( size: 16, color: colors.textBlack, ), ), ), if (address?.title != null) SizedBox( width: MediaQuery.sizeOf(context).width - 150.r, child: Text( address?.address?.address ?? "", style: AppStyle.interNormal( size: 12, color: AppStyle.textGrey, ), ), ), ], ), ), IconButton( onPressed: ()`
*No documentation provided (generation failed).*
