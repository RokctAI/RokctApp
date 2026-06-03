# API Reference: category_data

Source file: `lib/manager/infrastructure/models/data/category_data.dart`

## Classes

### class `CategoryData`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? shopId, String? uuid, String? keywords, int? parentId, String? type, String? img, bool? active, String? status, ShopData? shop, Translation? translation, List<CategoryData>? children, }) => CategoryData( id: id ?? _id, shopId: shopId ?? _shopId, uuid: uuid ?? _uuid, keywords: keywords ?? _keywords, parentId: parentId ?? _parentId, type: type ?? _type, img: img ?? _img, shop: shop ?? _shop, active: active ?? _active, status: status ?? _status, translation: translation ?? _translation, children: children ?? _children, ); int? get id => _id; int? get shopId => _shopId; String? get uuid => _uuid; String? get keywords => _keywords; int? get parentId => _parentId; String? get type => _type; String? get img => _img; ShopData? get shop => _shop; bool? get active => _active; String? get status => _status; Translation? get translation => _translation; List<CategoryData>? get children => _children; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
