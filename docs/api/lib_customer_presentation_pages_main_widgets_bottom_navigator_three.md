# API Reference: bottom_navigator_three

Source file: `lib/customer/presentation/pages/main/widgets/bottom_navigator_three.dart`

## Classes

### class `BottomNavigatorThree`

### class `FloatingNavbarItem`

## Whitelisted API Endpoints

### `BottomNavigatorThree({ super.key, required this.currentIndex, required this.onTap, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.symmetric(horizontal: 24), child: FloatingNavbar( backgroundColor: colors.textWhite, onTap: onTap, colors: colors, currentIndex: currentIndex, items: [ FloatingNavbarItem( customWidget: SvgPicture.asset( "assets/svgs/home3.svg", color: currentIndex == 0 ? colors.textBlack : AppStyle.textGrey, ), ), FloatingNavbarItem( customWidget: SvgPicture.asset( "assets/svgs/category3.svg", color: currentIndex == 1 ? colors.textBlack : AppStyle.textGrey, ), ), FloatingNavbarItem( customWidget: SvgPicture.asset( "assets/svgs/fosend3.svg", color: currentIndex == 2 ? colors.textBlack : AppStyle.textGrey, ), ), FloatingNavbarItem( customWidget: SvgPicture.asset( "assets/svgs/bag3.svg", color: currentIndex == 3 ? colors.textBlack : AppStyle.textGrey, ), ), ], ), ); } } typedef ItemBuilder = Widget Function(BuildContext context, int index, FloatingNavbarItem items); class FloatingNavbar extends StatefulWidget { final List<FloatingNavbarItem> items; final int currentIndex; final void Function(int val)? onTap; final Color selectedBackgroundColor; final Color? selectedItemColor; final Color? unselectedItemColor; final Color backgroundColor; final ItemBuilder itemBuilder; final double width; final double elevation; final CustomColorSet colors; FloatingNavbar({ super.key, required this.items, required this.currentIndex, required this.onTap, ItemBuilder? itemBuilder, this.backgroundColor = AppStyle.white, this.selectedBackgroundColor = AppStyle.transparent, this.selectedItemColor = AppStyle.black, this.unselectedItemColor = AppStyle.textGrey, this.width = double.infinity, this.elevation = 0.0, required this.colors, }) : assert(items.length > 1), assert(items.length <= 5), assert(currentIndex <= items.length), assert(width > 50), itemBuilder = itemBuilder ?? _defaultItemBuilder( unselectedItemColor: unselectedItemColor, selectedItemColor: selectedItemColor, width: width, backgroundColor: backgroundColor, currentIndex: currentIndex, items: items, onTap: onTap, selectedBackgroundColor: selectedBackgroundColor, ); @override _FloatingNavbarState createState() => _FloatingNavbarState(); } class _FloatingNavbarState extends State<FloatingNavbar> { List<FloatingNavbarItem> get items => widget.items; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: <Widget>[ Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(36.r), color: widget.backgroundColor, boxShadow: const [ BoxShadow( color: AppStyle.shadowBottom, blurRadius: 20, offset: Offset(0, -4), spreadRadius: 0, ), ], ), width: widget.width, child: Padding( padding: REdgeInsets.all(6), child: Container( padding: REdgeInsets.symmetric(vertical: 6), decoration: BoxDecoration( color: widget.colors.icon, borderRadius: BorderRadius.circular(32.r), ), child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisSize: MainAxisSize.max, children: items .asMap() .map( (i, f) => MapEntry(i, widget.itemBuilder(context, i, f)), ) .values .toList(), ), ), ), ), ], ); } } ItemBuilder _defaultItemBuilder({ Function(int val)? onTap, required List<FloatingNavbarItem> items, int? currentIndex, Color? selectedBackgroundColor, Color? selectedItemColor, Color? unselectedItemColor, Color? backgroundColor, double width = double.infinity, })`
*No documentation provided (generation failed).*
