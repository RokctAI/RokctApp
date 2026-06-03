# API Reference: recipient_widget

Source file: `lib/customer/presentation/pages/parcel/widgets/recipient_widget.dart`

## Classes

### class `RecipientWidget`

## Whitelisted API Endpoints

### `RecipientWidget({ super.key, required this.state, required this.event, required this.username, required this.phone, required this.house, required this.flour, required this.description, required this.addInstruction, required this.value, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ if (state.expand) Padding( padding: EdgeInsets.only(bottom: 16.r), child: Text( AppHelpers.getTranslation(TrKeys.recipient), style: AppStyle.interNoSemi(size: 16, color: colors.textBlack), ), ), InkWell( onTap: () async { final data = await context.pushRoute( ViewMapRoute(isShopLocation: true, isParcel: true), ); if (data.runtimeType == AddressNewModel)`
*No documentation provided (generation failed).*

### `Spacer(), Icon( FlutterRemix.arrow_right_s_line, color: colors.textBlack, ), ], ), ), ), ), ExpandedSection( expand: state.expand, child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ 24.verticalSpace, OutlinedBorderTextField( inputType: TextInputType.phone, label: AppHelpers.getTranslation(TrKeys.phoneNumber), textController: phone, validation: (s)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.merge( const BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.merge( const BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.merge( const BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), disabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.merge( const BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.merge( const BorderSide(color: AppStyle.transparent), const BorderSide(color: AppStyle.transparent), ), ), ), ), 16.verticalSpace, if (state.types.isNotEmpty) if ((state.types[state.selectType]?.options?.isNotEmpty ?? false)) SizedBox( height: 36.r, child: ListView.builder( padding: EdgeInsets.zero, scrollDirection: Axis.horizontal, itemCount: state.types[state.selectType]?.options?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `InkWell(onTap: ()`
*No documentation provided (generation failed).*
