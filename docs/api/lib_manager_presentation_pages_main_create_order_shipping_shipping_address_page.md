# API Reference: shipping_address_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/shipping_address_page.dart`

## Classes

### class `ManagerShippingAddressPage`

## Whitelisted API Endpoints

### `ManagerShippingAddressPage({super.key}); @override State<ManagerShippingAddressPage> createState() => _ShippingAddressPageState(); } class _ShippingAddressPageState extends State<ManagerShippingAddressPage> { late TextEditingController _userTextController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( resizeToAvoidBottomInset: false, backgroundColor: AppStyle.textGrey, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Container(padding: MediaQuery.viewInsetsOf(context), child: SingleChildScrollView( physics: const BouncingScrollPhysics(), child: Column( children: [ Container( decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.symmetric( vertical: 24, horizontal: 16, ), child: Column( children: [ 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.deliveryType, ), ), 24.verticalSpace, DeliveryTypeItem( iconData: FlutterRemix.takeaway_fill, title: AppHelpers.getTranslation( TrKeys.deliveryService, ), desc: '${AppHelpers.getTranslation(TrKeys.estimatedTime)} 25 - 30 min', isActive: deliveryState.type == TrKeys.delivery, onTap: () => deliveryEvent.setType(TrKeys.delivery), ), 8.verticalSpace, DeliveryTypeItem( iconData: FlutterRemix.walk_fill, title: AppHelpers.getTranslation(TrKeys.takeAway), desc: '${AppHelpers.getTranslation(TrKeys.approximateTime)} 25 - 30 min', isActive: deliveryState.type == TrKeys.pickup, onTap: () => deliveryEvent.setType(TrKeys.pickup), ), 8.verticalSpace, DeliveryTypeItem( iconData: Icons.table_restaurant, title: AppHelpers.getTranslation(TrKeys.dineIn), desc: '${AppHelpers.getTranslation(TrKeys.approximateTime)} 25 - 30 min', isActive: deliveryState.type == TrKeys.dineIn, onTap: () => deliveryEvent.setType(TrKeys.dineIn), ), ], ), ), 10.verticalSpace, if (deliveryState.type == TrKeys.delivery) Container( margin: REdgeInsets.only(bottom: 12), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.symmetric( vertical: 24, horizontal: 16, ), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.customerInformation, ), ), 24.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ UnderlinedTextField( label: userState.selectedUser != null ? AppHelpers.getTranslation( TrKeys.selectedUser, ) : AppHelpers.getTranslation( TrKeys.pleaseSelectAUser, ), readOnly: true, onTap: () async { await context.pushRoute( const ManagerSelectUserRoute(), ); }, textController: userState.userTextController, descriptionText: userState.selectedUser == null ? null : userState.selectedUser?.email ?? '', ), 16.verticalSpace, if (AppConstants.isSpecificNumberEnabled && userState.selectedUser != null) IntlPhoneField( disableLengthCheck: !AppConstants .isNumberLengthAlwaysSame, onChanged: (phoneNum)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), errorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), border: const UnderlineInputBorder(), focusedErrorBorder: const UnderlineInputBorder(), disabledBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), focusedBorder: const UnderlineInputBorder(), ), ), if (!AppConstants.isSpecificNumberEnabled && userState.selectedUser != null) UnderlinedTextField( label: TrKeys.phoneNumber, textController: _userTextController, onChanged: (value) => userNotifier.setPhone(value), ), ], ); }, ), ], ), ), if (deliveryState.type == TrKeys.delivery) Container( margin: REdgeInsets.only(bottom: 12), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r), ), ), padding: REdgeInsets.symmetric( vertical: 24, horizontal: 16, ), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.shippingAddress, ), ), 24.verticalSpace, Row( children: [ Expanded( child: UnderlinedTextField( label: AppHelpers.getTranslation( TrKeys.selectedAddress, ), textController: addressState.textController, readOnly: true, ), ), 10.horizontalSpace, ButtonsBouncingEffect( child: GestureDetector( onTap: () => context.pushRoute( const ManagerSelectAddressRoute(), ), child: Container( width: 40.r, height: 40.r, decoration: BoxDecoration( shape: BoxShape.circle, color: AppStyle.primary, ), alignment: Alignment.center, child: Icon( FlutterRemix.map_pin_add_fill, size: 24.r, color: AppStyle.blackColor, ), ), ), ), ], ), 24.verticalSpace, Row( children: [ Expanded( child: UnderlinedTextField( label: AppHelpers.getTranslation( TrKeys.entrance, ), onChanged: addressEvent.setEntrance, ), ), 8.horizontalSpace, Expanded( child: UnderlinedTextField( label: AppHelpers.getTranslation( TrKeys.floor, ), onChanged: addressEvent.setFloor, ), ), 8.horizontalSpace, Expanded( child: UnderlinedTextField( label: AppHelpers.getTranslation( TrKeys.house, ), onChanged: addressEvent.setHouse, ), ), ], ), ], ); }, ), ), if (deliveryState.type == TrKeys.dineIn) Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Container(margin: REdgeInsets.only(bottom: 10), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.symmetric( horizontal: 16, vertical: 24, ), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.selectTable, ), ), 16.verticalSpace, UnderlinedTextField( label: state.selectSection != null ? AppHelpers.getTranslation( TrKeys.selectedSection, ) : AppHelpers.getTranslation( TrKeys.pleaseSelectASection, ), readOnly: true, onTap: () => context.pushRoute( const ManagerSelectSectionRoute(), ), textController: state.textController, descriptionText: state.selectSection == null ? null : state .selectSection ?.translation ?.description ?? '', ), 4.verticalSpace, UnderlinedTextField( label: tableState.selectTable != null ? AppHelpers.getTranslation( TrKeys.selectedTable, ) : AppHelpers.getTranslation( TrKeys.pleaseSelectATable, ), readOnly: true, onTap: ()`
*No documentation provided (generation failed).*

### `Row(children: [ const PopButton(heroTag: AppConstants.heroTagAddOrderButton), 8.horizontalSpace, if ((ref.watch(deliveryTypeProvider).type == TrKeys.delivery && ref.watch(orderUserProvider).selectedUser?.phone != null) || ref.watch(deliveryTypeProvider).type == TrKeys.pickup || (ref.watch(deliveryTypeProvider).type == TrKeys.dineIn && ref.watch(tableProvider).selectTable != null)) Expanded( child: CustomButton( title: AppHelpers.getTranslation(TrKeys.next), onPressed: ()`
*No documentation provided (generation failed).*
