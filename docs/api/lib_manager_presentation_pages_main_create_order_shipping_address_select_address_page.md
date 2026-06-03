# API Reference: select_address_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/address/select_address_page.dart`

## Classes

### class `ManagerSelectAddressPage`

## Whitelisted API Endpoints

### `ManagerSelectAddressPage({super.key}); @override State<ManagerSelectAddressPage> createState() => _SelectAddressPageState(); } class _SelectAddressPageState extends State<ManagerSelectAddressPage> with TickerProviderStateMixin { late AnimationController _animationController; CameraPosition? _cameraPosition; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( backgroundColor: AppStyle.textGrey, resizeToAvoidBottomInset: false, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Stack(children: [ GoogleMap( tiltGesturesEnabled: false, myLocationButtonEnabled: false, zoomControlsEnabled: false, initialCameraPosition: CameraPosition( bearing: 0, target: LatLng( AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude, AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude, ), tilt: 0, zoom: 17, ), onMapCreated: (controller)`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), shrinkWrap: true, itemCount: state.searchedPlaces.length, padding: EdgeInsets.zero, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SearchedLocationItem(place: state.searchedPlaces[index], isLast: state.searchedPlaces.length - 1 == index, onTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 150), bottom: state.isChoosing ? -60.r : 20.r, left: 15.r, right: 15.r, child: Row( children: [ const PopButton( heroTag: AppConstants.heroTagAddOrderButton, ), 8.horizontalSpace, Expanded( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation( TrKeys.confirmLocation, ), onPressed: state.location == null ? null : ()`
*No documentation provided (generation failed).*
