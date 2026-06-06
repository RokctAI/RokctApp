# API Reference: categories_paginate_response

Source file: `lib/customer/models/response/categories_paginate_response.dart`

## Classes

### class `CategoriesPaginateResponse`

### class `CategoryData`

## Whitelisted API Endpoints

### `copyWith({ List<CategoryData>? data, Meta? meta, }) => CategoriesPaginateResponse( data: data ?? _data, meta: meta ?? _meta, ); List<CategoryData>? get data => _data; Meta? get meta => _meta; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? id, String? uuid, String? keywords, String? parentId, String? type, String? img, bool? active, String? createdAt, String? updatedAt, Translation? translation, List<CategoryData>? children, }) => CategoryData( id: id ?? _id, uuid: uuid ?? _uuid, keywords: keywords ?? _keywords, parentId: parentId ?? _parentId, type: type ?? _type, img: img ?? _img, active: active ?? _active, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, translation: translation ?? _translation, children: children ?? _children, ); String? get id => _id; String? get uuid => _uuid; String? get keywords => _keywords; String? get parentId => _parentId; String? get type => _type; String? get img => _img; bool? get active => _active; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Translation? get translation => _translation; List<CategoryData>? get children => _children; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
