# API Reference: address_selector

Source file: `lib/manager/presentation/pages/become_seller/widgets/address_selector.dart`

## Classes

### class `AddressSelector`

## Whitelisted API Endpoints

### `Function(dynamic) onAddressSelected; const AddressSelector({ super.key, required this.addressModel, required this.onAddressSelected, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Padding( padding: EdgeInsets.only(left: 4.w, bottom: 12.h), child: Text( AppHelpers.getTranslation(TrKeys.address), style: AppStyle.interSemi(size: 14, color: AppStyle.black), ), ), Material( color: AppStyle.white, borderRadius: BorderRadius.circular(12.r), child: InkWell( onTap: () async { final data = await context.pushRoute( ManagerViewMapRoute(isShopLocation: true, onChanged: ()`
*No documentation provided (generation failed).*
