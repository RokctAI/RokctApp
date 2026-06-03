# API Reference: view_map_page

Source file: `lib/manager/presentation/pages/view_map/view_map_page.dart`

## Classes

### class `ManagerViewMapPage`

## Whitelisted API Endpoints

### `ManagerViewMapPage(this.onChanged, { super.key, this.isShopLocation = false, this.shopId, }); @override ConsumerState<ManagerViewMapPage> createState() => _ViewMapPageState(); } class _ViewMapPageState extends ConsumerState<ManagerViewMapPage> { late ViewMapNotifier event; late TextEditingController controller; late TextEditingController office; late TextEditingController house; late TextEditingController floor; final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance; GoogleMapController? googleMapController; CameraPosition? cameraPosition; Dyn check; late LatLng latLng; @override void didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `checkPermission() async { check = await _geolocatorPlatform.checkPermission(); } Future<void> getMyLocation() async { if (check == LocationPermission.denied || check == LocationPermission.deniedForever)`
*No documentation provided (generation failed).*

### `initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( backgroundColor: AppStyle.black, body: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Expanded( child: SlidingUpPanel( borderRadius: BorderRadius.only( topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r), ), minHeight: 240.h, maxHeight: 240.h, color: AppStyle.white, body: Padding( padding: REdgeInsets.only(bottom: 0), child: Stack( children: [ GoogleMap( padding: REdgeInsets.only(bottom: 240.h), myLocationButtonEnabled: false, initialCameraPosition: CameraPosition( bearing: 0, target: latLng, tilt: 0, zoom: 17, ), mapToolbarEnabled: false, zoomControlsEnabled: true, onTap: (position)`
*No documentation provided (generation failed).*

### `placemarkFromCoordinates(cameraPosition?.target.latitude ?? latLng.latitude, cameraPosition?.target.longitude ?? latLng.longitude, ); if (placemarks.isNotEmpty)`
*No documentation provided (generation failed).*

### `placemarkFromCoordinates(cameraPosition?.target.latitude ?? latLng.latitude, cameraPosition?.target.longitude ?? latLng.longitude, ); if (placemarks.isNotEmpty)`
*No documentation provided (generation failed).*

### `getMyLocation(); }, child: Container( width: 50.r, height: 50.r, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.all( Radius.circular(10.r), ), boxShadow: const [ BoxShadow( color: AppStyle.shimmerBase, blurRadius: 2, offset: Offset(0, 2), ), ], ), child: const Center( child: Icon(FlutterRemix.navigation_line), ), ), ), ), ], ), ), padding: REdgeInsets.symmetric(horizontal: 15), panel: _bottomSheet(context, state), ), ), ], ), ), ), ); } Widget _bottomSheet(BuildContext context, ViewMapState state)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [ 8.verticalSpace, Container( width: 49.w, height: 3.h, decoration: BoxDecoration( borderRadius: BorderRadius.circular(40.r), color: AppStyle.dragElement, ), ), 16.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.enterADeliveryAddress), ), 24.verticalSpace, SearchTextField( isRead: true, isBorder: true, textEditingController: controller, onTap: () async { final placeId = await context.pushRoute( const ManagerMapSearchRoute(), ); if (placeId != null)`
*No documentation provided (generation failed).*

### `placemarkFromCoordinates(res?.result?.geometry?.location?.lat ?? latLng.latitude, res?.result?.geometry?.location?.lng ?? latLng.longitude, ); if (placemarks.isNotEmpty)`
*No documentation provided (generation failed).*

### `PopButton(heroTag: ''), 24.horizontalSpace, Expanded( child: Consumer( builder: (BuildContext context, WidgetRef ref, Widget? child)`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: false, textColor: AppStyle.black, title: AppHelpers.getTranslation(TrKeys.apply), onPressed: ()`
*No documentation provided (generation failed).*
