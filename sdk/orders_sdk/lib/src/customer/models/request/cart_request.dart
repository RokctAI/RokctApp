class LocalStorage {
  static dynamic getSelectedCurrency() => null;
  static dynamic getLanguage() => null;
}


class CartRequest {
  final String? shopId;
  final String? cartId;
  final String? userUuid;
  final String? stockId;
  final String? parentId;
  final int? quantity;
  final List<CartRequest>? carts;

  CartRequest({
    this.shopId,
    this.stockId,
    this.parentId,
    this.quantity,
    this.carts,
    this.cartId,
    this.userUuid,
  });

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    if (shopId != null) map["shop_id"] = shopId;
    if (cartId != null) map["cart_id"] = cartId;
    if (userUuid != null) map["user_cart_uuid"] = userUuid;
    if (stockId != null) map["stock_id"] = stockId;
    if (parentId != null) map["parent_id"] = parentId;
    if (quantity != null) map["quantity"] = quantity;
    map["rate"] = LocalStorage.getSelectedCurrency()?.rate ?? 1;
    map["currency_id"] = LocalStorage.getSelectedCurrency()?.id ?? "";
    return map;
  }

  Map<String, Dyn> toJsonInsert() {
    final map = <String, Dyn>{};
    if (shopId != null) map["shop_id"] = shopId;
    map["lang"] = LocalStorage.getLanguage()?.locale;
    map["rate"] = LocalStorage.getSelectedCurrency()?.rate ?? 1;
    map["currency_id"] = LocalStorage.getSelectedCurrency()?.id ?? "";
    if (cartId != null) map["cart_id"] = cartId;
    if (userUuid != null) map["user_cart_uuid"] = userUuid;
    if (carts != null) map["products"] = toJsonCart();
    return map;
  }

  List<Map<String, Dyn>> toJsonCart() {
    List<Map<String, Dyn>> list = [];
    carts?.forEach((element) {
      final map = <String, Dyn>{};
      map["stock_id"] = element.stockId;
      map["quantity"] = element.quantity;
      if (element.parentId != null) map["parent_id"] = element.parentId;
      if (cartId != null) map["cart_id"] = cartId;
      if (userUuid != null) map["user_cart_uuid"] = userUuid;
      if (!(element.quantity == 0 && element.parentId != null)) {
        list.add(map);
      }
    });

    return list;
  }
}

typedef Dyn = dynamic;
