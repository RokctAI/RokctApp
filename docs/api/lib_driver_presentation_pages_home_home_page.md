# API Reference: home_page

Source file: `lib/driver/presentation/pages/home/home_page.dart`

## Classes

### class `DriverHomePage`

## Whitelisted API Endpoints

### `DriverHomePage({super.key}); @override ConsumerState<DriverHomePage> createState() => _HomePageState(); } class _HomePageState extends ConsumerState<DriverHomePage> { final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance; final bool isLtr = LocalStorage.getLangLtr(); GoogleMapController? googleMapController; BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker; OrderDetailData? push; Timer? timer; LatLng latLng = LatLng( (LocalStorage.getAddressSelected()?.latitude ?? AppConstants.demoLatitude), (LocalStorage.getAddressSelected()?.longitude ?? AppConstants.demoLongitude), ); Position? currentLocation; Dyn check; final _delayed = Delayed(milliseconds: 36000); Future<void> setCustomMarkerIcon() async { final Uint8List markerMyIcon = await AppHelpers.svgToPng( Assets.svgMyLocation, ); myIcon = BitmapDescriptor.bytes(markerMyIcon); } Future<void> checkPermission() async { FirebaseMessaging.instance.requestPermission( sound: true, alert: true, badge: false, ); FirebaseMessaging.onMessage.listen((RemoteMessage message) async { debugPrint("New notification on message: ${jsonEncode(message.data)}"); if (message.data["id"] != null && mounted)`
*No documentation provided (generation failed).*

### `getMyLocation() async { try { check = await _geolocatorPlatform.checkPermission(); if (check == LocationPermission.denied || check == LocationPermission.deniedForever)`
*No documentation provided (generation failed).*

### `Duration(seconds: 10), (Timer t)`
*No documentation provided (generation failed).*

### `Duration(minutes: 10), ); WidgetsBinding.instance.addPostFrameCallback((_)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Stack(children: [ _map(context, ref), state.isGoRestaurant || state.isGoUser ? state.parcelDetail == null ? DeliverBottomSheetScreen( order: push ?? (state.orderDetail ?? OrderDetailData()), ) : ParcelBottomSheetScreen(parcel: state.parcelDetail) : BottomSheetScreen(isScrolling: state.isScrolling), state.isGoRestaurant || state.isGoUser ? const SizedBox.shrink() : _myFindButton(ref), AnimatedPositioned( duration: const Duration(milliseconds: 400), top: MediaQuery.paddingOf(context).top + 10.h, left: state.isScrolling ? -64.w : 16.w, child: ButtonsBouncingEffect( child: GestureDetector( onTap: () => context.pushRoute(const DriverProfileRoute()), child: Hero( tag: AppConstants.heroTagProfileAvatar, child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `DriverAvatar(imageUrl: LocalStorage.getUser()?.img, rate: LocalStorage.getUser()?.rate, ); }, ), ), ), ), ), AnimatedPositioned( duration: const Duration(milliseconds: 400), top: MediaQuery.paddingOf(context).top + 80.h, left: state.isScrolling ? -64.w : 12.w, child: ButtonsBouncingEffect( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Stack(children: [ Container( decoration: BoxDecoration( color: AppStyle.primary, borderRadius: BorderRadius.circular(16.r), ), margin: EdgeInsets.all(8.r), child: IconButton( onPressed: () => context.pushRoute( const DriverOrdersRoute(), ), icon: const Icon( FlutterRemix.history_fill, color: AppStyle.white, ), ), ), Positioned( top: 2.r, right: 8.r, child: Text( ref .watch(orderProvider) .totalActiveOrder .toString(), style: AppStyle.interBold( color: AppStyle.black, size: 18, ), ), ), ], ); }, ), ), ), AnimatedPositioned( duration: const Duration(milliseconds: 400), top: MediaQuery.paddingOf(context).top + 10.h, right: state.isScrolling ? -120.w : 16.w, child: Container( decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(6.r), child: CustomToggle( isOnline: (LocalStorage.getOnline()), onChange: (bool value)`
*No documentation provided (generation failed).*

### `Duration(minutes: 10), ); getCurrentLocation(); } else { timer?.cancel(); Workmanager().cancelAll(); } ref .read(homeProvider.notifier) .setOnline(context: context); }, ), ), ), if (state.isLoading) AnimatedPositioned( duration: const Duration(milliseconds: 500), child: _customLoading(context), ), ], ); }, ), ), ); } Widget _map(BuildContext context, WidgetRef ref)`
*No documentation provided (generation failed).*

### `SizedBox(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, child: GoogleMap( myLocationButtonEnabled: false, initialCameraPosition: CameraPosition( bearing: 0, target: LatLng( (LocalStorage.getAddressSelected()?.latitude ?? AppConstants.demoLatitude), (LocalStorage.getAddressSelected()?.longitude ?? AppConstants.demoLongitude), ), tilt: 0, zoom: 17, ), markers: { Marker( markerId: const MarkerId("source"), icon: myIcon, position: LatLng( currentLocation?.latitude ?? latLng.latitude, currentLocation?.longitude ?? latLng.longitude, ), ), ...ref.watch(homeProvider).markers, }, polygons: ref.watch(homeProvider).polygon, polylines: ref.watch(homeProvider).isGoRestaurant || ref.watch(homeProvider).isGoUser ? { Polyline( polylineId: const PolylineId("startLocation"), points: ref.watch(homeProvider).endPolylineCoordinates, color: AppStyle.primary.withValues(alpha: 0.4), width: 6, ), Polyline( polylineId: const PolylineId("market"), points: ref.watch(homeProvider).polylineCoordinates, color: AppStyle.primary, width: 6, ), } : {}, mapToolbarEnabled: true, zoomControlsEnabled: false, onMapCreated: (controller)`
*No documentation provided (generation failed).*

### `BlurWrap(radius: BorderRadius.zero, blur: 1, child: Container( width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, color: AppStyle.white.withValues(alpha: 0.3), child: const Loading(), ), ); } Widget _myFindButton(WidgetRef ref)`
*No documentation provided (generation failed).*
