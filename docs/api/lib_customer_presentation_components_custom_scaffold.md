# API Reference: custom_scaffold

Source file: `lib/customer/presentation/components/custom_scaffold.dart`

## Classes

### class `CustomScaffold`

## Whitelisted API Endpoints

### `Function(CustomColorSet colors) body; final Widget? Function(CustomColorSet colors)? floatingActionButton; final Widget? Function(CustomColorSet colors)? bottomNavigationBar; final FloatingActionButtonLocation? floatingActionButtonLocation; final PreferredSizeWidget? Function(CustomColorSet colors)? appBar; final Color? backgroundColor; final bool bgImage; final bool extendBody; const CustomScaffold({ super.key, required this.body, this.appBar, this.floatingActionButton, this.floatingActionButtonLocation, this.backgroundColor, this.bottomNavigationBar, this.bgImage = false, this.extendBody = false, }); @override State<CustomScaffold> createState() => _CustomScaffoldState(); } class _CustomScaffoldState extends State<CustomScaffold> with WidgetsBindingObserver { StreamSubscription? connectivitySubscription; ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false); void _checkCurrentNetworkState()`
*No documentation provided (generation failed).*

### `initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Stack(fit: StackFit.expand, children: [ ThemeWrapper( builder: (colors, controller)`
*No documentation provided (generation failed).*
