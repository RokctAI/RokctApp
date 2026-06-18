import 'package:get_it/get_it.dart';
import '../../order_sdk.dart';
import '../banners_repository.dart';
import '../blogs_repository.dart';
import '../brands_repository.dart';
import '../currencies_repository.dart';
import '../gallery_repository.dart';
import '../order_repository.dart';
import '../subscription_repository.dart';
import '../table_repository.dart';
import 'package:rokctapp/customer/repository/cart_repository.dart';
import 'package:rokctapp/customer/repository/categories_repository.dart';
import 'package:rokctapp/customer/repository/products_repository.dart';
import 'package:rokctapp/customer/repository/shops_repository.dart';
import 'package:rokctapp/driver/infrastructure/repositories/orders_repository.dart' as driver_orders_impl;
import 'package:rokctapp/manager/infrastructure/repositories/orders_repository.dart' as manager_orders_impl;
import 'package:rokctapp/manager/infrastructure/repositories/products_repository.dart' as manager_products_impl;
import 'package:rokctapp/manager/infrastructure/repositories/shops_repository.dart' as manager_shops_impl;
import 'package:rokctapp/manager/infrastructure/repositories/catalog_repository.dart';

class OrderSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<ProductsRepositoryFacade>(ProductsRepository());
    getIt.registerSingleton<ShopsRepositoryFacade>(ShopsRepository());
    getIt.registerSingleton<BrandsRepositoryFacade>(BrandsRepository());
    getIt.registerSingleton<GalleryRepositoryFacade>(GalleryRepository());
    getIt.registerSingleton<CategoriesRepositoryFacade>(CategoriesRepository());
    getIt.registerSingleton<BannersRepositoryFacade>(BannersRepository());
    getIt.registerSingleton<OrdersInterface>(OrdersRepository());
    getIt.registerSingleton<BlogsRepositoryFacade>(BlogsRepository());
    getIt.registerSingleton<CartRepositoryFacade>(CartRepository());
    
    getIt.registerSingleton<driver_orders_int.DriverOrdersRepository>(driver_orders_impl.OrdersRepository());
    getIt.registerSingleton<TableInterface>(TableRepository());
    getIt.registerSingleton<ShopsInterface>(manager_shops_impl.ShopsRepository());
    getIt.registerSingleton<OrdersInterface>(manager_orders_impl.OrdersRepository());
    getIt.registerSingleton<CatalogInterface>(CatalogRepository());
    getIt.registerSingleton<ProductsInterface>(manager_products_impl.ProductsRepository());
    getIt.registerSingleton<SubscriptionsFacade>(SubscriptionsRepository());
  }
}
