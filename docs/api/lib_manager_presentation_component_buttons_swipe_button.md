# API Reference: swipe_button

Source file: `lib/manager/presentation/component/buttons/swipe_button.dart`

## Classes

### class `SwipeButton`

## Whitelisted API Endpoints

### `Duration(milliseconds: 250), }) : assert(elevationThumb >= 0.0), assert(elevationTrack >= 0.0); @override State<SwipeButton> createState() => _SwipeState(); } class _SwipeState extends State<SwipeButton> with TickerProviderStateMixin { late AnimationController swipeAnimationController; late AnimationController expandAnimationController; bool swiped = false; @override void initState()`
*No documentation provided (generation failed).*

### `didUpdateWidget(covariant SwipeButton oldWidget)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `SizedBox(width: widget.width, height: widget.height, child: LayoutBuilder( builder: (context, constraints) => Stack( clipBehavior: Clip.none, children: [ _buildTrack(context, constraints), _buildThumb(context, constraints), ], ), ), ); } Widget _buildTrack(BuildContext context, BoxConstraints constraints)`
*No documentation provided (generation failed).*

### `Padding(padding: widget.trackPadding, child: Material( elevation: elevationTrack, borderRadius: borderRadius, clipBehavior: Clip.antiAlias, color: trackColor, child: Container( width: constraints.maxWidth, height: widget.height, decoration: BoxDecoration(borderRadius: borderRadius), clipBehavior: Clip.antiAlias, alignment: Alignment.center, child: widget.child, ), ), ); } Widget _buildThumb(BuildContext context, BoxConstraints constraints)`
*No documentation provided (generation failed).*
