# API Reference: service_page

Source file: `lib/customer/presentation/pages/service/service_page.dart`

## Classes

### class `ServicePage`

## Whitelisted API Endpoints

### `ServicePage({super.key}); @override State<ServicePage> createState() => _ServicePageState(); } class _ServicePageState extends State<ServicePage> { late RefreshController categoryController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Column(children: [ Consumer( builder: (context, ref, ch)`
*No documentation provided (generation failed).*

### `CommonAppBar(child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [ SizedBox(width: 46.r), const Spacer(), Text( AppHelpers.getTranslation(TrKeys.allServices), style: AppStyle.interNoSemi(color: colors.textBlack), ), const Spacer(), IconButton( onPressed: ()`
*No documentation provided (generation failed).*

### `SmartRefresher(scrollDirection: Axis.vertical, enablePullDown: false, enablePullUp: true, controller: categoryController, onLoading: () async { await notifier.fetchCategoriesPage( context, categoryController, ); }, child: GridView.custom( physics: const BouncingScrollPhysics(), padding: REdgeInsets.symmetric( horizontal: 16, vertical: 12, ), gridDelegate: SliverQuiltedGridDelegate( crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12, repeatPattern: QuiltedGridRepeatPattern.same, pattern: [ const QuiltedGridTile(1, 2), const QuiltedGridTile(1, 1), const QuiltedGridTile(1, 1), const QuiltedGridTile(1, 2), ], ), childrenDelegate: SliverChildBuilderDelegate( childCount: state.categories.length, (context, index) => ServiceTwoCategoriesItem( colors: colors, category: state.categories[index], onTap: () async { if (state.selectIndexCategory != index)`
*No documentation provided (generation failed).*
