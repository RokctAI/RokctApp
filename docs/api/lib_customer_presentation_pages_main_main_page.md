# API Reference: main_page

Source file: `lib/customer/presentation/pages/main/main_page.dart`

## Classes

### class `MainPage`

## Whitelisted API Endpoints

### `MainPage({super.key, this.isListen = true}); @override State<MainPage> createState() => _MainPageState(); } class _MainPageState extends State<MainPage> { List listPages = [ [ IndexedStackChild(child: const HomePage(), preload: true), IndexedStackChild(child: const SearchPage(isBackButton: false)), IndexedStackChild(child: const LikePage(isBackButton: false)), IndexedStackChild( child: const ProfilePage(isBackButton: false), preload: true, ), ], [ IndexedStackChild(child: const HomeOnePage(), preload: true), IndexedStackChild(child: const ServicePage()), ], [ IndexedStackChild(child: const HomeTwoPage(), preload: true), IndexedStackChild(child: const ServicePage()), ], [ IndexedStackChild(child: const HomePageThree(), preload: true), IndexedStackChild(child: const ServicePage()), ], ]; @override void initState()`
*No documentation provided (generation failed).*

### `launch("${AppConstants.webUrl}/blog/${message.data["uuid"]}", forceSafariVC: true, forceWebView: true, enableJavaScript: true, ); } else { if (mounted)`
*No documentation provided (generation failed).*

### `launch("${AppConstants.webUrl}/blog/${message.data["uuid"]}", forceSafariVC: true, forceWebView: true, enableJavaScript: true, ); }, ); } else if (mounted)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: CustomScaffold( body: (colors) => Consumer( builder: (BuildContext context, WidgetRef ref, Widget? child)`
*No documentation provided (generation failed).*

### `ProsteIndexedStack(index: index, children: listPages[AppHelpers.getType()], ); }, ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, floatingActionButton: (colors) => AppHelpers.getType() == 0 ? Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `BottomNavigatorThree(currentIndex: ref.watch(mainProvider).selectIndex, onTap: (int value)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const OrderRoute()); return; } if (value == 2)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const ParcelRoute()); return; } ref.read(mainProvider.notifier).selectIndex(value); }, colors: colors, ); }, ) : const SizedBox(), bottomNavigationBar: (colors) => Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const OrderRoute()); return; } if (value == 2)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const ParcelRoute()); return; } event.selectIndex(value); }, ) : AppHelpers.getType() == 2 ? BottomNavigatorTwo( colors: colors, currentIndex: index, onTap: (int value)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const OrderRoute()); return; } if (value == 2)`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute(const ParcelRoute()); return; } event.selectIndex(value); }, ) : const SizedBox(); }, ), ), ); } Widget _bottom( int index, WidgetRef ref, MainNotifier event, BuildContext context, ProfileData? user, Cart? orders,)`
*No documentation provided (generation failed).*

### `Row(mainAxisAlignment: MainAxisAlignment.center, children: [ BlurWrap( radius: BorderRadius.circular(100.r), child: AnimatedContainer( duration: const Duration(milliseconds: 500), decoration: BoxDecoration( color: AppStyle.bottomNavigationBar.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(100.r), ), height: 60.r, child: Padding( padding: EdgeInsets.symmetric(horizontal: 10.r), child: Row( mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [ BottomNavigatorItem( isScrolling: index == 3 ? false : mainState.isScrolling, selectItem: ()`
*No documentation provided (generation failed).*
