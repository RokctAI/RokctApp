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

// Driver and Manager Namespace Imports
import 'package:rokctapp/driver/presentation/pages/pages.dart' as driver_pages;
import 'package:rokctapp/manager/presentation/pages/pages.dart'
    as manager_pages;

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
    CupertinoRoute(path: '/driver', page: driver_pages.SplashRoute.page),
    CupertinoRoute(
      path: '/driver/no-connection',
      page: driver_pages.NoConnectionRoute.page,
    ),
    CupertinoRoute(path: '/driver/login', page: driver_pages.LoginRoute.page),
    CupertinoRoute(path: '/driver/income', page: driver_pages.IncomeRoute.page),
    CupertinoRoute(path: '/driver/home', page: driver_pages.HomeRoute.page),
    CupertinoRoute(path: '/driver/story', page: driver_pages.StoryRoute.page),
    CupertinoRoute(
      path: '/driver/profile',
      page: driver_pages.ProfileRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/list-notification',
      page: driver_pages.NotificationListRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/order-history',
      page: driver_pages.OrderHistoryRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/parcel-history',
      page: driver_pages.ParcelHistoryRoute.page,
    ),
    CupertinoRoute(path: '/driver/orders', page: driver_pages.OrdersRoute.page),
    CupertinoRoute(
      path: '/driver/parcels',
      page: driver_pages.ParcelsRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/become-driver',
      page: driver_pages.BecomeDriverRoute.page,
    ),
    CupertinoRoute(
      path: '/driver/delivery-zone',
      page: driver_pages.DeliveryZoneRoute.page,
    ),

    // Manager
    CupertinoRoute(path: '/manager', page: manager_pages.SplashRoute.page),
    CupertinoRoute(path: '/manager/main', page: manager_pages.MainRoute.page),
    CupertinoRoute(path: '/manager/auth', page: manager_pages.AuthRoute.page),
    CupertinoRoute(path: '/manager/order', page: manager_pages.OrderRoute.page),
    CupertinoRoute(
      path: '/manager/income',
      page: manager_pages.IncomeRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/select-user',
      page: manager_pages.SelectUserRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/delivery-time',
      page: manager_pages.DeliveryTimeRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/order-history',
      page: manager_pages.OrderHistoryRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/delivery-zone',
      page: manager_pages.DeliveryZoneRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/no-connection',
      page: manager_pages.NoConnectionRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/select-address',
      page: manager_pages.SelectAddressRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/order-products',
      page: manager_pages.CreateOrderRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/shipping-address',
      page: manager_pages.ShippingAddressRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/list-notification',
      page: manager_pages.NotificationListRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/view_map',
      page: manager_pages.ViewMapRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/become_seller',
      page: manager_pages.CreateShopRoute.page,
    ),
    CupertinoRoute(
      path: '/manager/search_map',
      page: manager_pages.MapSearchRoute.page,
    ),
    MaterialRoute(
      path: '/manager/select-section',
      page: manager_pages.SelectSectionRoute.page,
    ),
    MaterialRoute(
      path: '/manager/select-table',
      page: manager_pages.SelectTableRoute.page,
    ),
    MaterialRoute(
      path: '/manager/webview',
      page: manager_pages.WebViewRoute.page,
    ),
    MaterialRoute(
      path: '/manager/subscription',
      page: manager_pages.SubscriptionsRoute.page,
    ),
  ];
}
