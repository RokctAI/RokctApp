# API Reference: addons_data

Source file: `lib/customer/models/data/addons_data.dart`

## Whitelisted API Endpoints

### `Addons(id: json?["id"], stockId: json?["stock_id"], addonId: json?["addon_id"], active: false, product: (json?["product"] == null) ? null : Product.fromJson(json?["product"]), stocks: json?["stock"] == null ? null : Stocks.fromJson(json?["stock"]), quantity: json?["quantity"] ?? json?["product"]["min_qty"] ?? 0, price: json?["price"] ?? json?["total_price"], ); } Map<String, Dyn> toJson() => { "id": id, "stock_id": stockId, "addon_id": addonId, "product": product?.toJson(), }; } class Product { Product({ this.id, this.uuid, this.shopId, this.categoryId, this.brandId, this.tax, this.barCode, this.status, this.active, this.addon, this.img, this.minQty, this.maxQty, this.createdAt, this.updatedAt, this.ratingPercent, this.translation, this.locales, this.stock, this.reviews, }); int? id; String? uuid; int? shopId; int? categoryId; int? brandId; num? tax; String? barCode; String? status; bool? active; bool? addon; String? img; int? minQty; int? maxQty; DateTime? createdAt; DateTime? updatedAt; Dyn ratingPercent; Translation? translation; List<String>? locales; Stocks? stock; List<Dyn>? reviews; factory Product.fromJson(Map<String, Dyn>? json)`
*No documentation provided (generation failed).*
