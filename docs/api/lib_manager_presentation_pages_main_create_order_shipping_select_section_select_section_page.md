# API Reference: select_section_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/select_section/select_section_page.dart`

## Classes

### class `ManagerSelectSectionPage`

## Whitelisted API Endpoints

### `ManagerSelectSectionPage({super.key}); @override ConsumerState<ManagerSelectSectionPage> createState() => _SelectSectionPageState(); } class _SelectSectionPageState extends ConsumerState<ManagerSelectSectionPage> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( backgroundColor: AppStyle.textGrey, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ CustomAppBar( bottomPadding: 4.h, child: SearchTextField( onChanged: (value) => event.setQuery( refreshController: _refreshController, text: value, ), ), ), Expanded( child: state.isLoading ? const Loading() : SmartRefresher( controller: _refreshController, enablePullUp: true, onRefresh: () => event.refreshSections( refreshController: _refreshController, ), onLoading: () => event.fetchMoreSections( refreshController: _refreshController, ), child: ListView.builder( physics: const BouncingScrollPhysics(), itemCount: state.sections.length, shrinkWrap: true, padding: REdgeInsets.only( left: 16, right: 16, top: 20, bottom: 80, ), itemBuilder: (context, index) => SectionItem( section: state.sections[index], isSelected: index == state.selectedIndex, onTap: ()`
*No documentation provided (generation failed).*
