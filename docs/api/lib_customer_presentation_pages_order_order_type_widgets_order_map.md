# API Reference: order_map

Source file: `lib/customer/presentation/pages/order/order_type/widgets/order_map.dart`

## Classes

### class `OrderMap`

## Whitelisted API Endpoints

### `OrderMap({ super.key, required this.markers, required this.latLng, required this.polylineCoordinates, required this.isLoading, }); LatLngBounds _bounds(Set<Marker> markers)`
*No documentation provided (generation failed).*

### `ClipRRect(borderRadius: BorderRadius.circular(10.r), child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: colors.backgroundColor, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(16.r), height: 260.h, child: isLoading ? const Center(child: Loading()) : Listener( behavior: HitTestBehavior.opaque, child: GoogleMap( gestureRecognizers: { Factory<OneSequenceGestureRecognizer>( () => EagerGestureRecognizer(), ), }, padding: REdgeInsets.only(bottom: 15), myLocationButtonEnabled: false, zoomGesturesEnabled: true, scrollGesturesEnabled: true, rotateGesturesEnabled: true, tiltGesturesEnabled: true, markers: markers, onMapCreated: (GoogleMapController controller)`
*No documentation provided (generation failed).*
