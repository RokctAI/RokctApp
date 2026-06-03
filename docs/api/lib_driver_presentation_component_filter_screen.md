# API Reference: filter_screen

Source file: `lib/driver/presentation/component/filter_screen.dart`

## Classes

### class `FilterScreen`

## Whitelisted API Endpoints

### `FilterScreen({ super.key, this.isTabBar = true, this.start, this.end, this.parcel = false, }); @override State<FilterScreen> createState() => _FilterScreenState(); } class _FilterScreenState extends State<FilterScreen> with SingleTickerProviderStateMixin { late TabController _tabController; List<DateTime?> _rangeDatePicker = []; List<DateTime?> _newList = []; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))), Tab( child: Text( AppHelpers.getTranslation(TrKeys.weekly), maxLines: 1, overflow: TextOverflow.clip, ), ), Tab( child: Text( AppHelpers.getTranslation(TrKeys.monthly), maxLines: 1, overflow: TextOverflow.clip, ), ), Tab(child: Text(AppHelpers.getTranslation(TrKeys.overall))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(days: 7)), DateTime.now(), ]; _newList = _rangeDatePicker; break; case 2: _rangeDatePicker = [ DateTime.now().subtract(const Duration(days: 30)), DateTime.now(), ]; _newList = _rangeDatePicker; break; case 3: _rangeDatePicker = [ DateTime.now().subtract(const Duration(days: 120)), DateTime.now(), ]; _newList = _rangeDatePicker; break; } setState(()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.filter)), ), Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Text( AppHelpers.getTranslation(TrKeys.selectDesiredOrderHistory), style: AppStyle.interNormal( size: 14.sp, color: AppStyle.black, letterSpacing: -0.3, ), ), ), widget.isTabBar ? Padding( padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h), child: CustomTabBar( scroll: true, tabController: _tabController, tabs: _tabs, ), ) : const SizedBox.shrink(), CustomDatePicker( range: _rangeDatePicker, onChange: (n)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*
