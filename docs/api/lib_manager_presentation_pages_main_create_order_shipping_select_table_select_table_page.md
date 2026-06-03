# API Reference: select_table_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/select_table/select_table_page.dart`

## Classes

### class `ManagerSelectTablePage`

## Whitelisted API Endpoints

### `ManagerSelectTablePage({super.key, required this.sectionId}); @override ConsumerState<ManagerSelectTablePage> createState() => _SelectTablePageState(); } class _SelectTablePageState extends ConsumerState<ManagerSelectTablePage> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( backgroundColor: AppStyle.textGrey, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ CustomAppBar( bottomPadding: 4.h, child: SearchTextField( onChanged: (value) => event.setQuery( sectionId: widget.sectionId, refreshController: _refreshController, text: value, ), ), ), Expanded( child: state.isLoading ? const Loading() : SmartRefresher( controller: _refreshController, enablePullUp: true, onRefresh: () => event.refreshTables( sectionId: widget.sectionId, refreshController: _refreshController, ), onLoading: () => event.fetchMoreTables( sectionId: widget.sectionId, refreshController: _refreshController, ), child: ListView.builder( physics: const BouncingScrollPhysics(), itemCount: state.tables.length, shrinkWrap: true, padding: REdgeInsets.only( left: 16, right: 16, top: 20, bottom: 80, ), itemBuilder: (context, index) => TableItem( table: state.tables[index], isSelected: index == state.selectedIndex, onTap: ()`
*No documentation provided (generation failed).*
