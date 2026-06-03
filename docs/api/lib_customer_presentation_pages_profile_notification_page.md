# API Reference: notification_page

Source file: `lib/customer/presentation/pages/profile/notification_page.dart`

## Classes

### class `NotificationListPage`

## Whitelisted API Endpoints

### `NotificationListPage({super.key}); @override ConsumerState<NotificationListPage> createState() => _NotificationListPageState(); } class _NotificationListPageState extends ConsumerState<NotificationListPage> { final bool isLtr = LocalStorage.getLangLtr(); late RefreshController refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => state.isAllNotificationsLoading ? const Loading() : Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.notifications), style: AppStyle.interNoSemi( size: 18, color: colors.textBlack, ), ), ), Expanded( child: SmartRefresher( controller: refreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `InkWell(onTap: () async { if (state.notifications[index].readAt == null)`
*No documentation provided (generation failed).*

### `launch("${AppConstants.webUrl}/blog/${state.notifications[index].blogData?.uuid}", forceSafariVC: true, forceWebView: true, enableJavaScript: true, ); } else if (state.notifications[index].type == "reservation")`
*No documentation provided (generation failed).*

### `launch("${AppConstants.webUrl}/reservations", forceSafariVC: true, forceWebView: true, enableJavaScript: true, ); } else { AppHelpers.showAlertDialog( context: context, child: Text( '${state.notifications[index].body ?? state.notifications[index].title}', ), ); } }, child: Column( children: [ notificationItem( state.notifications[index], colors, ), const Divider(), ], ), ); }, ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, floatingActionButton: (colors) => Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( children: [ const PopButton(), 10.horizontalSpace, Expanded( child: CustomButton( background: AppStyle.black, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.readAll), onPressed: () async { event.readAll(context); }, ), ), ], ), ), ), ); } Widget notificationItem( NotificationModel notification, CustomColorSet colors,)`
*No documentation provided (generation failed).*
