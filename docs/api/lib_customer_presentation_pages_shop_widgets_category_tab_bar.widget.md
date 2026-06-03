# API Reference: category_tab_bar.widget

Source file: `lib/customer/presentation/pages/shop/widgets/category_tab_bar.widget.dart`

## Classes

### class `CategoryTabBar`

## Whitelisted API Endpoints

### `CategoryTabBar({ super.key, required this.controller, required this.textController, required this.data, required this.isLoading, required this.overlapsContent, }); final TabController controller; final TextEditingController textController; final List<All> data; final bool overlapsContent; final bool isLoading; @override State<CategoryTabBar> createState() => _CategoryTabBarState(); } class _CategoryTabBarState extends State<CategoryTabBar> { @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Material(color: colors.backgroundColor, elevation: widget.overlapsContent ? 16 : 0, shadowColor: Colors.black38, child: CustomPaint( foregroundPainter: theme.isDark ? null : FadingEffect(), child: Row( mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.end, children: [ 12.horizontalSpace, TabSearch(controller: widget.textController), Expanded( child: LayoutBuilder( builder: (context, constraints) => widget.isLoading ? const ShimmerCategoryList() : TabBar( controller: widget.controller, isScrollable: true, padding: REdgeInsets.only( top: MediaQuery.paddingOf(context).top - 8, bottom: 8, left: 12, right: 16, ), labelPadding: REdgeInsets.symmetric(horizontal: 16), indicatorWeight: 6, onTap: (index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 250), ); }, indicator: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: colors.primary, ), tabs: List.generate(widget.data.length, (index)`
*No documentation provided (generation failed).*

### `Container(height: 48.r, decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), boxShadow: [ BoxShadow( color: AppStyle.white.withValues( alpha: 0.07, ), spreadRadius: 0, blurRadius: 2, offset: const Offset( 0, 1, ), ), ], ), child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [ 3.verticalSpace, Text( item.translation?.title ?? '', style: AppStyle.interNormal( size: 13, color: colors.textBlack, ), ), ], ), ); }), ), ), ), ], ), ), ); }, ); } } Timer? timer; class FadingEffect extends CustomPainter { @override void paint(Canvas canvas, Size size)`
*No documentation provided (generation failed).*
