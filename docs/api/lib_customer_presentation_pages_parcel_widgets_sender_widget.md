# API Reference: sender_widget

Source file: `lib/customer/presentation/pages/parcel/widgets/sender_widget.dart`

## Classes

### class `SenderWidget`

## Whitelisted API Endpoints

### `SenderWidget({ super.key, required this.state, required this.event, required this.username, required this.phone, required this.house, required this.flour, required this.comment, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ if (state.expand) Padding( padding: EdgeInsets.only(bottom: 16.r), child: Text( AppHelpers.getTranslation(TrKeys.sender), style: AppStyle.interNoSemi(size: 16), ), ), InkWell( onTap: () async { final data = await context.pushRoute( ViewMapRoute(isShopLocation: true, isParcel: true), ); if (data.runtimeType == AddressNewModel)`
*No documentation provided (generation failed).*

### `Spacer(), Icon( FlutterRemix.arrow_right_s_line, color: colors.textBlack, ), ], ), ), ), ), ExpandedSection( expand: state.expand, child: Column( children: [ 24.verticalSpace, OutlinedBorderTextField( inputType: TextInputType.phone, label: AppHelpers.getTranslation(TrKeys.phoneNumber), textController: phone, validation: (s)`
*No documentation provided (generation failed).*
