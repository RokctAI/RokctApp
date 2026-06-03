# API Reference: local_address_data

Source file: `lib/customer/models/data/local_address_data.dart`

## Classes

### class `LocalAddressData`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? title, String? address, LocalLocation? location, bool? isDefault, bool? isSelected, }) => LocalAddressData( id: id ?? _id, title: title ?? _title, address: address ?? _address, location: location ?? _location, isDefault: isDefault ?? _default, isSelected: isSelected ?? _isSelected, ); int? get id => _id; String? get title => _title; String? get address => _address; LocalLocation? get location => _location; bool? get isDefault => _default; bool? get isSelected => _isSelected; Map<String, Dyn> toJson() => { 'address': _address, 'location': '${_location?.latitude},${_location?.longitude}', 'active': 1, if (_title?.isNotEmpty ?? false) 'title': _title, 'default': (_isSelected ?? false) ? 1 : 0, }; @override String toString()`
*No documentation provided (generation failed).*
