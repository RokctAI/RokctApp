# API Reference: view_map_page

Source file: `lib/customer/presentation/pages/view_map/view_map_page.dart`

## Classes

### class `ViewMapPage`

## Whitelisted API Endpoints

### `ViewMapPage({ super.key, this.isParcel = false, this.isPop = true, this.isShopLocation = false, this.isSelectLocation = false, this.shopId, this.indexAddress, this.address, }); @override ConsumerState<ViewMapPage> createState() => _ViewMapPageState(); } class _ViewMapPageState extends ConsumerState<ViewMapPage> { late ViewMapNotifier event; late TextEditingController controller; final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance; GoogleMapController? googleMapController; CameraPosition? cameraPosition; Dyn check; late LatLng latLng; final Delayed delayed = Delayed(milliseconds: 700); String? _lastGeocodedAddress; LatLng? _lastGeocodedLatLng; /// Gets address from coordinates with caching /// Returns formatted address string Future<String> _getAddressFromCoordinates(LatLng coordinates) async { if (_lastGeocodedLatLng != null && _isSameLocation(_lastGeocodedLatLng!, coordinates))`
*No documentation provided (generation failed).*

### `placemarkFromCoordinates(coordinates.latitude, coordinates.longitude, ); if (placemarks.isNotEmpty)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `checkPermission() async { check = await _geolocatorPlatform.checkPermission(); } Future<void> getMyLocation() async { if (check == LocationPermission.denied || check == LocationPermission.deniedForever)`
*No documentation provided (generation failed).*

### `initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => SizedBox( width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, child: Stack( children: [ SizedBox( width: MediaQuery.sizeOf(context).width, height: state.isScrolling ? MediaQuery.sizeOf(context).height : MediaQuery.sizeOf(context).height - 0.r, child: GoogleMap( style: LocalStorage.getAppThemeMode() ? jsonEncode(AppMapThemes.mapDarkTheme) : null, onCameraMoveStarted: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), child: Image.asset( "assets/images/marker.png", width: 46.w, height: 46.h, ), ), AnimatedPositioned( top: MediaQuery.paddingOf(context).top + 12, left: 24, right: 24, duration: const Duration(milliseconds: 500), child: Center( child: DecoratedBox( decoration: BoxDecoration( color: colors.textWhite, borderRadius: BorderRadius.circular(12.r), ), child: SearchTextField( isRead: true, hintText: AppHelpers.getTranslation(TrKeys.search), textEditingController: TextEditingController( text: controller.text, ), onTap: () async { final LatLng? result = await context.pushRoute( const MapSearchRoute(), ); if (result != null)`
*No documentation provided (generation failed).*

### `MapSearchRoute(), ); if (placeId != null)`
*No documentation provided (generation failed).*
