# API Reference: filter_screen

Source file: `lib/manager/presentation/component/filter_screen.dart`

## Classes

### class `FilterScreen`

## Whitelisted API Endpoints

### `FilterScreen({ super.key, this.isTabBar = true, required this.onChangeDay, }); @override State<FilterScreen> createState() => _FilterScreenState(); } class _FilterScreenState extends State<FilterScreen> with SingleTickerProviderStateMixin { late TabController _tabController; List<DateTime?> _rangeDatePicker = [DateTime.now(), DateTime.now()]; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))), Tab( child: Text( AppHelpers.getTranslation(TrKeys.weekly), maxLines: 1, overflow: TextOverflow.clip, ), ), Tab( child: Text( AppHelpers.getTranslation(TrKeys.monthly), maxLines: 1, overflow: TextOverflow.clip, ), ), Tab(child: Text(AppHelpers.getTranslation(TrKeys.overall))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(days: 7)), DateTime.now(), ]; break; case 2: _rangeDatePicker = [ DateTime.now().subtract(const Duration(days: 30)), DateTime.now(), ]; break; case 3: _rangeDatePicker = [ DateTime.now().subtract(const Duration(days: 120)), DateTime.now(), ]; break; } setState(()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ const ModalDrag(), Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.filter), ), ), Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Text( AppHelpers.getTranslation(TrKeys.selectDesiredOrderHistory), style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), ), widget.isTabBar ? Padding( padding: EdgeInsets.symmetric( horizontal: 16.w, vertical: 24.h, ), child: CustomTabBar( tabController: _tabController, tabs: _tabs, ), ) : const SizedBox.shrink(), CustomDatePicker(range: _rangeDatePicker), 16.verticalSpace, Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (BuildContext context, WidgetRef ref, Widget? child)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*
