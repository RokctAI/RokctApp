import 'package:admin_desktop/src/core/handlers/handlers.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import '../models/data/edit_shop_data.dart';
import 'package:admin_desktop/src/models/models.dart';

abstract class ShopsRepository {
  Future<ApiResult<ShopsPaginateResponse>> searchShops(String? query);

  Future<ApiResult<ShopsPaginateResponse>> getShopsByIds(List<int> shopIds);
  Future<ApiResult<EditShopData>> getShopData();

  Future<ApiResult<CategoriesPaginateResponse>> getShopCategory();

  Future<ApiResult<CategoriesPaginateResponse>> getShopTag();

  Future<ApiResult<EditShopData>> updateShopData({
    required EditShopData editShopData,
    required String logoImg,
    required String backImg,
    List<DropdownItem<String>>? category,
    List<DropdownItem<String>>? tag,
    List<DropdownItem<String>>? type,
    String? displayName,
  });

  Future<ApiResult<void>> updateShopWorkingDays({
    required List<ShopWorkingDays> workingDays,
    String? uuid,
  });

  Future<ApiResult<ShopDeliveriesResponse>> getOnlyDeliveries();
}
