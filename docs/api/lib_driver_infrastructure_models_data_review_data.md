# API Reference: review_data

Source file: `lib/driver/infrastructure/models/data/review_data.dart`

## Classes

### class `ReviewData`

### class `Galleries`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? reviewableId, String? rating, String? comment, String? img, String? createdAt, String? updatedAt, List<Galleries>? galleries, UserData? user, }) => ReviewData( id: id ?? _id, reviewableId: reviewableId ?? _reviewableId, rating: rating ?? _rating, comment: comment ?? _comment, img: img ?? _img, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, galleries: galleries ?? _galleries, user: user ?? _user, ); int? get id => _id; int? get reviewableId => _reviewableId; String? get rating => _rating; String? get comment => _comment; String? get img => _img; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; List<Galleries>? get galleries => _galleries; UserData? get user => _user; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? title, String? type, int? loadableId, String? path, String? basePath, }) => Galleries( id: id ?? _id, title: title ?? _title, type: type ?? _type, loadableId: loadableId ?? _loadableId, path: path ?? _path, basePath: basePath ?? _basePath, ); int? get id => _id; String? get title => _title; String? get type => _type; int? get loadableId => _loadableId; String? get path => _path; String? get basePath => _basePath; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
