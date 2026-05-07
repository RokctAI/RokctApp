# 🤖 Android Build Errors

The following syntax errors were found during the build process:

## `lib/core/infrastructure/utils/app_database.dart`
- line 1, column 526 of package:rokctapp/core/infrastructure/utils/app_database.dart: Could not resolve annotation for `class AppDatabase`.
- ╷
- 1  │ ┌ @DriftDatabase(
- 2  │ │   tables: [
- 3  │ │     ProductsTable,
- 4  │ │     StocksTable,
- 5  │ │     EventQueueTable,
- 6  │ │     OrdersTable,
- 7  │ │     OrderItemsTable,
- 8  │ │     ShopTable,
- 9  │ │     CategoriesTable,
- 10 │ │     SettingsTable,
- 11 │ │     BillingCartTable,
- 12 │ │     SyncQueueTable,
- 13 │ │     AbandonedSyncQueueTable,
- 14 │ │     UserTable,
- 15 │ │     BannersTable,
- 16 │ │     NotificationsTable,
- 17 │ │   ],
- 18 │ └ )
- ╵

## `lib/core/infrastructure/utils/drift_tables.dart`
- line 1, column 37 of package:rokctapp/core/infrastructure/utils/drift_tables.dart: Could not resolve annotation for `class ProductsTable`.
- ╷
- 1 │ @DataClassName('ProductEntity')
- │ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
- ╵
- 3s json_serializable on 2514 inputs: 113 skipped, 154 no-op; spent 2s analyzing; lib/core/presentation/pages/auth/confirmation/register_confirmation_page.freezed.dart
- 4s json_serializable on 2514 inputs: 182 skipped, 255 no-op; spent 3s analyzing; lib/customer/models/data/blog_data.freezed.dart
- 5s json_serializable on 2514 inputs: 360 skipped, 433 no-op; spent 4s analyzing; lib/customer/presentation/pages/home/home_two/widget/delivery_banner.freezed.dart
- 6s json_serializable on 2514 inputs: 476 skipped, 549 no-op; spent 5s analyzing, 1s building; lib/customer/presentation/pages/shop/cart/widgets/note_product.freezed.dart
- 7s json_serializable on 2514 inputs: 577 skipped, 690 no-op; spent 5s analyzing, 1s building; lib/driver/infrastructure/models/data/profile_data.freezed.dart
- 8s json_serializable on 2514 inputs: 716 skipped, 845 no-op; spent 6s analyzing, 2s building; lib/manager/application/foods/create/stocks/create_food_stocks_notifier.freezed.dart
- 9s json_serializable on 2514 inputs: 810 skipped, 1031 no-op; spent 7s analyzing, 2s building; lib/manager/application/product/products_state.freezed.dart
- 10s json_serializable on 2514 inputs: 1006 skipped, 1245 no-op; spent 8s analyzing, 2s building; lib/manager/presentation/component/tab_bars/categories_tab_bar.freezed.dart
- 11s json_serializable on 2514 inputs: 1137 skipped, 1377 no-op; spent 8s analyzing, 2s building
- 0s source_gen:combining_builder on 2514 inputs; lib/core/application/app/app_notifier.dart
- 0s source_gen:combining_builder on 2514 inputs: 1 no-op; lib/core/application/app/app_notifier.freezed.dart
- 1s source_gen:combining_builder on 2514 inputs: 724 skipped, 861 no-op; lib/manager/application/foods/edit/details/units/edit_food_units_notifier.freezed.dart
- 2s source_gen:combining_builder on 2514 inputs: 1137 skipped, 1377 no-op; spent 2s building
- 0s auto_route_generator on 5028 inputs; lib/core/application/app/app_notifier.dart
- 0s auto_route_generator on 5028 inputs: 388 skipped, 3 output, 154 no-op; lib/core/presentation/pages/auth/register/register_page.freezed.dart
- 1s auto_route_generator on 5028 inputs: 1287 skipped, 23 output, 455 no-op; spent 1s building; lib/customer/presentation/pages/order/order_screen/order_screen.freezed.dart
- 2s auto_route_generator on 5028 inputs: 2131 skipped, 44 output, 742 no-op; spent 2s building; lib/driver/presentation/pages/income/income_page.freezed.dart
- 3s auto_route_generator on 5028 inputs: 3436 skipped, 63 output, 1242 no-op; spent 3s building; lib/manager/presentation/pages/main/foods/create/stocks/create_food_addons_modal.freezed.dart
- 4s auto_route_generator on 5028 inputs: 3651 skipped, 70 output, 1307 no-op; spent 3s building
- 0s auto_route_generator:auto_router_generator on 5028 inputs; lib/core/application/app/app_notifier.dart
- 1s auto_route_generator:auto_router_generator on 5028 inputs: 2628 skipped, 1 output, 1020 no-op; lib/manager/application/order_details/order_details_notifier.freezed.dart
- 1s auto_route_generator:auto_router_generator on 5028 inputs: 3651 skipped, 1 output, 1376 no-op

