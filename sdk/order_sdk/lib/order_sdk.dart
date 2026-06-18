import 'package:get_it/get_it.dart';
library order_sdk;

export 'src/models/data/order_models.dart';
export 'src/order_repository.dart';
export 'src/order_sdk_impl.dart';

export 'src/models/data/product_data.dart';
export 'src/models/data/shop_data.dart';
export 'src/models/data/table_data.dart';
export 'src/models/data/table_model.dart';

// Domain Interfaces
export 'src/domain/interface/banners.dart';
export 'src/domain/interface/blogs.dart';
export 'src/domain/interface/brands.dart';
export 'src/domain/interface/cart.dart';
export 'src/domain/interface/categories.dart';
export 'src/domain/interface/gallery.dart';
export 'src/domain/interface/orders.dart';
export 'src/domain/interface/products.dart';
export 'src/domain/interface/shops.dart';
export 'src/domain/interface/manager_catalog.dart';
export 'src/domain/interface/manager_orders.dart';
export 'src/domain/interface/manager_products.dart';
export 'src/domain/interface/manager_shops.dart';
export 'src/domain/interface/manager_subscription_facade.dart';
export 'src/domain/interface/manager_table.dart';
export 'src/domain/interface/driver_orders.dart';

export 'src/di/order_di.dart';

// Global DI Getters
ProductsRepositoryFacade get productsRepository => GetIt.instance.get<ProductsRepositoryFacade>();
ShopsRepositoryFacade get shopsRepository => GetIt.instance.get<ShopsRepositoryFacade>();
CategoriesRepositoryFacade get categoriesRepository => GetIt.instance.get<CategoriesRepositoryFacade>();
BrandsRepositoryFacade get brandsRepository => GetIt.instance.get<BrandsRepositoryFacade>();
OrdersInterface get ordersRepository => GetIt.instance.get<OrdersInterface>();
BannersRepositoryFacade get bannersRepository => GetIt.instance.get<BannersRepositoryFacade>();
BlogsRepositoryFacade get blogsRepository => GetIt.instance.get<BlogsRepositoryFacade>();
CartRepositoryFacade get cartRepository => GetIt.instance.get<CartRepositoryFacade>();
driver_orders_int.DriverOrdersRepository get driverOrdersRepository => GetIt.instance.get<driver_orders_int.DriverOrdersRepository>();
TableInterface get managerTableRepository => GetIt.instance.get<TableInterface>();
ShopsInterface get managerShopsRepository => GetIt.instance.get<ShopsInterface>();
manager_orders_int.OrdersInterface get managerOrdersRepository => GetIt.instance.get<manager_orders_int.OrdersInterface>();
CatalogInterface get managerCatalogRepository => GetIt.instance.get<CatalogInterface>();
ProductsInterface get managerProductsRepository => GetIt.instance.get<ProductsInterface>();
SubscriptionsFacade get managerSubscriptionsRepository => GetIt.instance.get<SubscriptionsFacade>();

export 'src/customer_draw_repository.dart';
export 'src/driver_draw_repository_impl.dart';

export 'src/models/currency_data.dart';
