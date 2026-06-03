# API Reference: review_data

Source file: `lib/manager/infrastructure/models/data/review_data.dart`

## Classes

### class `ReviewData`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? reviewableId, String? rating, String? comment, String? img, String? createdAt, String? updatedAt, List<ImageData>? galleries, UserData? user, }) => ReviewData( id: id ?? _id, reviewableId: reviewableId ?? _reviewableId, rating: rating ?? _rating, comment: comment ?? _comment, img: img ?? _img, createdAt: createdAt ?? _createdAt, galleries: galleries ?? _galleries, user: user ?? _user, ); int? get id => _id; int? get reviewableId => _reviewableId; String? get rating => _rating; String? get comment => _comment; String? get img => _img; String? get createdAt => _createdAt; List<ImageData>? get galleries => _galleries; UserData? get user => _user; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
