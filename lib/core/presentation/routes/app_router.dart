import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Core and Customer Page Imports
import 'package:rokctapp/customer/presentation/pages/home/filter/result_filter.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_two/widget/recommended_two_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rokctapp/core/presentation/pages/auth/login/login_page.dart';
import 'package:rokctapp/core/presentation/pages/auth/confirmation/register_confirmation_page.dart';
import 'package:rokctapp/core/presentation/pages/auth/register/register_page.dart';
import 'package:rokctapp/core/presentation/pages/auth/reset/reset_password_page.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_one/widget/recommended_one_screen.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_three/widgets/recommended_three_screen.dart';
import 'package:rokctapp/core/presentation/pages/initial/no_connection/no_connection_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/splash/splash_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/ui_type/ui_type_page.dart';
import 'package:rokctapp/customer/presentation/pages/like/like_page.dart';
import 'package:rokctapp/customer/presentation/pages/main/main_page.dart';
import 'package:rokctapp/customer/presentation/pages/order/order_screen/order_screen.dart';
import 'package:rokctapp/customer/presentation/pages/order/orders_page.dart';
import 'package:rokctapp/customer/presentation/pages/parcel/parcel_list_page.dart';
import 'package:rokctapp/customer/presentation/pages/parcel/parcel_order_page.dart';
import 'package:rokctapp/customer/presentation/pages/parcel/widgets/info_screen.dart';
import 'package:rokctapp/core/presentation/pages/policy_term/policy_page.dart';
import 'package:rokctapp/core/presentation/pages/policy_term/term_page.dart';
import 'package:rokctapp/customer/presentation/pages/profile/address_list.dart';
import 'package:rokctapp/customer/presentation/pages/profile/notification_page.dart';
import 'package:rokctapp/customer/presentation/pages/profile/profile_page.dart';
import 'package:rokctapp/customer/presentation/pages/profile/share_referral_faq.dart';
import 'package:rokctapp/core/presentation/pages/search/search_page.dart';
import 'package:rokctapp/customer/presentation/pages/service/service_two_category_page.dart';
import 'package:rokctapp/customer/presentation/pages/setting/setting_page.dart';
import 'package:rokctapp/customer/presentation/pages/shop/shop_detail.dart';
import 'package:rokctapp/customer/presentation/pages/shop/shop_page.dart';
import 'package:rokctapp/customer/presentation/pages/view_map/map_search_page.dart';
import 'package:rokctapp/customer/presentation/pages/view_map/view_map_page.dart';
import 'package:rokctapp/customer/models/data/address_new_data.dart';
import 'package:rokctapp/customer/models/data/shop_data.dart';
import 'package:rokctapp/customer/models/data/user.dart';
import 'package:rokctapp/core/presentation/pages/chat/chat/chat_page.dart';
import 'package:rokctapp/customer/presentation/pages/home/widgets/shops_banner_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/location/permission_location.dart';
import 'package:rokctapp/customer/presentation/pages/order/order_screen/order_progress_screen.dart';
import 'package:rokctapp/customer/presentation/pages/parcel/parcel_page.dart';
import 'package:rokctapp/customer/presentation/pages/profile/become_seller/create_shop.dart';
import 'package:rokctapp/customer/presentation/pages/profile/help_page.dart';
import 'package:rokctapp/customer/presentation/pages/home/widgets/recommended_screen.dart';
import 'package:rokctapp/customer/presentation/pages/profile/share_referral_page.dart';
import 'package:rokctapp/customer/presentation/pages/profile/wallet_history.dart';
import 'package:rokctapp/core/presentation/pages/story_page/story_page.dart';

// Driver and Manager Namespace Imports (removed unused)

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Core
    MaterialRoute(path: '/', page: SplashRoute.page),
    MaterialRoute(path: '/no-connection', page: NoConnectionRoute.page),
    MaterialRoute(path: '/login', page: LoginRoute.page),
    MaterialRoute(path: '/ui-type', page: UiTypeRoute.page),
    MaterialRoute(
      path: '/permission-location-route',
      page: PermissionLocationRoute.page,
    ),
    MaterialRoute(path: '/reset', page: ResetPasswordRoute.page),
    MaterialRoute(
      path: '/register-confirmation',
      page: RegisterConfirmationRoute.page,
    ),
    MaterialRoute(path: '/register', page: RegisterRoute.page),
    MaterialRoute(path: '/main', page: MainRoute.page),
    MaterialRoute(path: '/shop', page: ShopRoute.page),
    MaterialRoute(path: '/order', page: OrdersListRoute.page),
    MaterialRoute(path: '/setting', page: SettingRoute.page),
    MaterialRoute(path: '/orderScreen', page: OrderRoute.page),
    MaterialRoute(path: '/searchPage', page: SearchRoute.page),
    MaterialRoute(path: '/ProfilePage', page: ProfileRoute.page),
    MaterialRoute(path: '/map', page: ViewMapRoute.page),
    MaterialRoute(path: "/storyList", page: StoryListRoute.page),
    MaterialRoute(path: '/recommended', page: RecommendedRoute.page),
    MaterialRoute(path: '/recommended_one', page: RecommendedOneRoute.page),
    MaterialRoute(path: '/recommended_two', page: RecommendedTwoRoute.page),
    MaterialRoute(path: '/map_search', page: MapSearchRoute.page),
    MaterialRoute(path: '/help', page: HelpRoute.page),
    MaterialRoute(path: '/order_progress', page: OrderProgressRoute.page),
    MaterialRoute(path: '/result_filter', page: ResultFilterRoute.page),
    MaterialRoute(path: '/wallet_history', page: WalletHistoryRoute.page),
    MaterialRoute(path: '/create_shop', page: CreateShopRoute.page),
    MaterialRoute(path: '/shops_banner', page: ShopsBannerRoute.page),
    MaterialRoute(path: '/shops_detail', page: ShopDetailRoute.page),
    MaterialRoute(path: '/share_referral', page: ShareReferralRoute.page),
    MaterialRoute(
      path: '/share_referral_faq',
      page: ShareReferralFaqRoute.page,
    ),
    MaterialRoute(path: '/chat', page: ChatRoute.page),
    MaterialRoute(
      path: '/notification_list_page',
      page: NotificationListRoute.page,
    ),
    MaterialRoute(
      path: '/service_two_category_page',
      page: ServiceTwoCategoryRoute.page,
    ),
    MaterialRoute(path: '/recommended_three', page: RecommendedThreeRoute.page),
    MaterialRoute(path: '/parcel_page', page: ParcelRoute.page),
    MaterialRoute(path: '/info_screen', page: InfoRoute.page),
    MaterialRoute(path: '/like_page', page: LikeRoute.page),
    MaterialRoute(path: '/parcel_list_page', page: ParcelListRoute.page),
    MaterialRoute(
      path: '/parcel_progress_page',
      page: ParcelProgressRoute.page,
    ),
    MaterialRoute(path: '/address_list_page', page: AddressListRoute.page),
    MaterialRoute(path: '/term', page: TermRoute.page),
    MaterialRoute(path: '/policy', page: PolicyRoute.page),

    // Driver
    CupertinoRoute(path: '/driver', page: DriverSplashRoute.page),
    CupertinoRoute(
      path: '/driver/no-connection',
      page: DriverNoConnectionRoute.page,
    ),
    CupertinoRoute(path: '/driver/login', page: DriverLoginRoute.page),
    CupertinoRoute(path: '/driver/income', page: DriverIncomeRoute.page),
    CupertinoRoute(path: '/driver/home', page: DriverHomeRoute.page),
    CupertinoRoute(path: '/driver/story', page: DriverStoryRoute.page),
    CupertinoRoute(path: '/driver/profile', page: DriverProfileRoute.page),
    CupertinoRoute(
      path: '/driver/list-notification',
      page: DriverNotificationListRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/order-history',
      page: DriverOrderHistoryRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/parcel-history',
      page: DriverParcelHistoryRoute.page,
    ),
    CupertinoRoute(path: '/driver/orders', page: DriverOrdersRoute.page),
    CupertinoRoute(path: '/driver/parcels', page: DriverParcelsRoute.page),
    CupertinoRoute(
      path: '/driver/become-driver',
      page: DriverBecomeDriverRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/delivery-zone',
      page: DriverDeliveryZoneRoute.page,
    ),

    // Manager
    CupertinoRoute(path: '/manager', page: ManagerSplashRoute.page),
    CupertinoRoute(path: '/manager/main', page: ManagerMainRoute.page),
    CupertinoRoute(path: '/manager/auth', page: ManagerAuthRoute.page),
    CupertinoRoute(path: '/manager/order', page: ManagerOrderRoute.page),
    CupertinoRoute(path: '/manager/income', page: ManagerIncomeRoute.page),
    CupertinoRoute(
      path: '/manager/select-user',
      page: ManagerSelectUserRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/delivery-time',
      page: ManagerDeliveryTimeRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/order-history',
      page: ManagerOrderHistoryRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/delivery-zone',
      page: ManagerDeliveryZoneRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/no-connection',
      page: ManagerNoConnectionRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/select-address',
      page: ManagerSelectAddressRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/order-products',
      page: ManagerCreateOrderRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/shipping-address',
      page: ManagerShippingAddressRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/list-notification',
      page: ManagerNotificationListRoute.page,
    ),
    CupertinoRoute(path: '/manager/view_map', page: ManagerViewMapRoute.page),
    CupertinoRoute(
      path: '/manager/become_seller',
      page: ManagerCreateShopRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/search_map',
      page: ManagerMapSearchRoute.page,
    ),
    MaterialRoute(
      path: '/manager/select-section',
      page: ManagerSelectSectionRoute.page,
    ),
    MaterialRoute(
      path: '/manager/select-table',
      page: ManagerSelectTableRoute.page,
    ),
    MaterialRoute(path: '/manager/webview', page: ManagerWebViewRoute.page),
    MaterialRoute(
      path: '/manager/subscription',
      page: ManagerSubscriptionsRoute.page,
    ),
  ];
}
