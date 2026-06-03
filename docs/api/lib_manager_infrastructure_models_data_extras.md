# API Reference: extras

Source file: `lib/manager/infrastructure/models/data/extras.dart`

## Classes

### class `Extras`

### class `StockPivot`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? extraGroupId, String? value, Group? group, StockPivot? pivot, bool? active, }) => Extras( id: id ?? _id, extraGroupId: extraGroupId ?? _extraGroupId, value: value ?? _value, group: group ?? _group, pivot: pivot ?? _pivot, active: active ?? _active, ); int? get id => _id; int? get extraGroupId => _extraGroupId; String? get value => _value; Group? get group => _group; StockPivot? get pivot => _pivot; bool? get active => _active; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({int? stockId, int? extraValueId}) => StockPivot( stockId: stockId ?? _stockId, extraValueId: extraValueId ?? _extraValueId, ); int? get stockId => _stockId; int? get extraValueId => _extraValueId; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
