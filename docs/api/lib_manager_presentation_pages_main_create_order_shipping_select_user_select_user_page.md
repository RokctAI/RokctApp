# API Reference: select_user_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/select_user/select_user_page.dart`

## Classes

### class `ManagerSelectUserPage`

## Whitelisted API Endpoints

### `ManagerSelectUserPage({super.key}); @override ConsumerState<ManagerSelectUserPage> createState() => _SelectUserPageState(); } class _SelectUserPageState extends ConsumerState<ManagerSelectUserPage> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( backgroundColor: AppStyle.textGrey, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ CustomAppBar( bottomPadding: 4.h, child: SearchTextField( onChanged: (value) => event.setQuery( refreshController: _refreshController, text: value, ), ), ), state.isLoading ? Center( child: Container( margin: REdgeInsets.only(top: 30), width: 30.r, height: 30.r, child: CircularProgressIndicator( strokeWidth: 3.r, color: AppStyle.blackColor, ), ), ) : Expanded( child: SmartRefresher( controller: _refreshController, enablePullUp: true, onRefresh: () => event.refreshUsers( refreshController: _refreshController, ), onLoading: () => event.fetchMoreUsers( refreshController: _refreshController, ), child: ListView.builder( physics: const BouncingScrollPhysics(), itemCount: state.users.length, shrinkWrap: true, padding: REdgeInsets.only( left: 16, right: 16, top: 20, bottom: 80, ), itemBuilder: (context, index) => UserItem( user: state.users[index], isSelected: index == state.selectedIndex, onTap: ()`
*No documentation provided (generation failed).*
