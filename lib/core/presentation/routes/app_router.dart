import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// @generated-imports-start

// @generated-imports-end

// Core and Customer Page Imports
import 'package:rokctapp/customer/presentation/pages/home/filter/result_filter.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_two/widget/recommended_two_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_one/widget/recommended_one_screen.dart';
import 'package:rokctapp/customer/presentation/pages/home/home_three/widgets/recommended_three_screen.dart';
import 'package:rokctapp/core/presentation/pages/initial/no_connection/no_connection_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/splash/splash_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/ui_type/ui_type_page.dart';
import 'package:rokctapp/customer/presentation/pages/main/main_page.dart';
import 'package:rokctapp/customer/presentation/pages/order/order_screen/order_screen.dart';
import 'package:rokctapp/customer/presentation/pages/order/orders_page.dart';
import 'package:rokctapp/core/presentation/pages/policy_term/policy_page.dart';
import 'package:rokctapp/core/presentation/pages/policy_term/term_page.dart';
import 'package:rokctapp/core/presentation/pages/search/search_page.dart';
import 'package:rokctapp/customer/presentation/pages/service/service_two_category_page.dart';
import 'package:rokctapp/customer/presentation/pages/shop/shop_detail.dart';
import 'package:rokctapp/customer/presentation/pages/shop/shop_page.dart';
import 'package:rokctapp/customer/presentation/pages/view_map/map_search_page.dart';
import 'package:rokctapp/customer/presentation/pages/view_map/view_map_page.dart';
import 'package:rokctapp/customer/models/data/address_new_data.dart';
import 'package:rokctapp/customer/models/data/shop_data.dart';
import 'package:rokctapp/customer/models/data/user.dart';
import 'package:rokctapp/customer/presentation/pages/home/widgets/shops_banner_page.dart';
import 'package:rokctapp/core/presentation/pages/initial/location/permission_location.dart';
import 'package:rokctapp/customer/presentation/pages/order/order_screen/order_progress_screen.dart';
import 'package:rokctapp/customer/presentation/pages/profile/help_page.dart';
import 'package:rokctapp/customer/presentation/pages/home/widgets/recommended_screen.dart';
import 'package:rokctapp/core/presentation/pages/story_page/story_page.dart';

// Driver Page Imports
import 'package:rokctapp/driver/presentation/pages/orders/orders_page.dart';
import 'package:rokctapp/driver/presentation/pages/parcels_history/parcel_history.dart';
import 'package:rokctapp/driver/presentation/pages/order_history/order_history.dart';
import 'package:rokctapp/driver/presentation/pages/income/income_page.dart';
import 'package:rokctapp/driver/presentation/pages/parcel/parcels_page.dart';

// Manager Page Imports
import 'package:rokctapp/manager/presentation/pages/view_map/map_search_page.dart';
import 'package:rokctapp/manager/presentation/pages/view_map/view_map_page.dart';
import 'package:rokctapp/manager/presentation/pages/restaurant/subscriptions/subscriptions_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/main_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/create_order_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/order/order_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/shipping_address_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/select_section/select_section_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/select_table/select_table_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/select_user/select_user_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/details/delivery_time_page.dart';
import 'package:rokctapp/manager/presentation/pages/main/create_order/shipping/address/select_address_page.dart';
import 'package:rokctapp/manager/presentation/pages/order_history/order_history.dart';
import 'package:rokctapp/manager/presentation/component/web_view_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // @generated-routes-start

// @generated-routes-end
    // Core
    MaterialRoute(path: '/', page: SplashRoute.page),
    MaterialRoute(path: '/no-connection', page: NoConnectionRoute.page),
    MaterialRoute(path: '/ui-type', page: UiTypeRoute.page),
    MaterialRoute(
      path: '/permission-location-route',
      page: PermissionLocationRoute.page,
    ),
    MaterialRoute(
      path: '/register-confirmation',
    ),
    MaterialRoute(path: '/main', page: MainRoute.page),
    MaterialRoute(path: '/shop', page: ShopRoute.page),
    MaterialRoute(path: '/order', page: OrdersListRoute.page),
    MaterialRoute(path: '/orderScreen', page: OrderRoute.page),
    MaterialRoute(path: '/searchPage', page: SearchRoute.page),
    MaterialRoute(path: '/map', page: ViewMapRoute.page),
    MaterialRoute(path: "/storyList", page: StoryListRoute.page),
    MaterialRoute(path: '/recommended', page: RecommendedRoute.page),
    MaterialRoute(path: '/recommended_one', page: RecommendedOneRoute.page),
    MaterialRoute(path: '/recommended_two', page: RecommendedTwoRoute.page),
    MaterialRoute(path: '/map_search', page: MapSearchRoute.page),
    MaterialRoute(path: '/help', page: HelpRoute.page),
    MaterialRoute(path: '/order_progress', page: OrderProgressRoute.page),
    MaterialRoute(path: '/result_filter', page: ResultFilterRoute.page),
    MaterialRoute(path: '/shops_banner', page: ShopsBannerRoute.page),
    MaterialRoute(path: '/shops_detail', page: ShopDetailRoute.page),
    MaterialRoute(
      path: '/share_referral_faq',
    ),
    MaterialRoute(
      path: '/notification_list_page',
    ),
    MaterialRoute(
      path: '/service_two_category_page',
      page: ServiceTwoCategoryRoute.page,
    ),
    MaterialRoute(path: '/recommended_three', page: RecommendedThreeRoute.page),
    MaterialRoute(
      path: '/parcel_progress_page',
    ),
    MaterialRoute(path: '/term', page: TermRoute.page),
    MaterialRoute(path: '/policy', page: PolicyRoute.page),

    // Driver
    CupertinoRoute(path: '/driver', page: SplashRoute.page),
    CupertinoRoute(path: '/driver/no-connection', page: NoConnectionRoute.page),
    CupertinoRoute(path: '/driver/income', page: DriverIncomeRoute.page),
    CupertinoRoute(
      path: '/driver/list-notification',
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
      path: '/driver/delivery-zone',
    ),

    // Manager
    CupertinoRoute(path: '/manager', page: SplashRoute.page),
    CupertinoRoute(path: '/manager/main', page: ManagerMainRoute.page),
    CupertinoRoute(path: '/manager/order', page: ManagerOrderRoute.page),
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
    ),
    CupertinoRoute(
      path: '/manager/no-connection',
      page: NoConnectionRoute.page,
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
    ),
    CupertinoRoute(path: '/manager/view_map', page: ManagerViewMapRoute.page),
    CupertinoRoute(
      path: '/manager/become_seller',
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
    MaterialRoute(
      path: '/manager/subscription',
      page: ManagerSubscriptionsRoute.page,
    ),
    MaterialRoute(path: '/manager/webview', page: ManagerWebViewRoute.page),
  ];
}
