# API Reference: main_page

Source file: `lib/manager/presentation/pages/main/main_page.dart`

## Classes

### class `ManagerMainPage`

## Whitelisted API Endpoints

### `ManagerMainPage({super.key}); @override State<ManagerMainPage> createState() => _MainPageState(); } class _MainPageState extends State<ManagerMainPage> { List<IndexedStackChild> list = [ IndexedStackChild(child: const OrdersHomePage(), preload: true), IndexedStackChild(child: const FoodsPage(), preload: false), IndexedStackChild(child: const RestaurantPage(), preload: false), ]; Timer? timer; int time = 0; final player = AudioPlayer(); Future playMusic() async { timer?.cancel(); timer = Timer.periodic(const Duration(seconds: 3), (timer) async { await player.play(AssetSource("audio/notification.wav")); }); } @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDisable( child: Scaffold( resizeToAvoidBottomInset: false, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Row(mainAxisAlignment: MainAxisAlignment.center, children: [ BlurWrap( radius: BorderRadius.circular(100.r), child: AnimatedContainer( duration: const Duration(milliseconds: 500), decoration: BoxDecoration( color: AppStyle.bottomNavigationBar.withOpacity(0.6), borderRadius: BorderRadius.circular(100.r), ), height: 60.r, child: Padding( padding: REdgeInsets.only( right: 10, left: !state.isScrolling ? 10 : 0, ), child: Row( mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ BottomNavigatorItem( isScrolling: state.isScrolling, selectItem: () => event.selectIndex(0), currentIndex: state.selectedIndex, index: 0, selectIcon: FlutterRemix.file_list_2_fill, unSelectIcon: FlutterRemix.file_list_2_line, ), BottomNavigatorItem( isScrolling: state.isScrolling, selectItem: () => event.selectIndex(1), index: 1, currentIndex: state.selectedIndex, selectIcon: FlutterRemix.restaurant_fill, unSelectIcon: FlutterRemix.restaurant_line, ), _profileItem(()`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `ManagerCreateOrderRoute(), ) : (foodTabState.selectedIndex == 0 ? AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf( context, ).top + 64.h, context: context, modal: const CreateProductModal(), isDarkMode: false, ) : (foodTabState.selectedIndex == 1 ? AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf( context, ).top + 64.h, context: context, modal: const CreateAddonModal(), isDarkMode: false, ) : AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf( context, ).top + 64.h, context: context, modal: const CreateExtrasGroupModal(), isDarkMode: false, ))); }, child: Container( margin: EdgeInsetsDirectional.only( start: 8.r, ), width: 56.r, height: 56.r, decoration: BoxDecoration( shape: BoxShape.circle, color: AppStyle.primary, ), child: Icon( FlutterRemix.add_line, size: 26.r, color: AppStyle.buttonFont, ), ), ); }, ), ), ) : const SizedBox.shrink(), ], ); }, ), ), ), ); } GestureDetector _profileItem(Function() onTap, int index)`
*No documentation provided (generation failed).*
