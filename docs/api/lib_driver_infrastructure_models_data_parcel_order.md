# API Reference: parcel_order

Source file: `lib/driver/infrastructure/models/data/parcel_order.dart`

## Classes

### class `ParcelOrder`

### class `Address`

### class `Currency`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? userId, num? totalPrice, num? rate, String? status, String? phoneTo, String? note, String? usernameTo, Address? addressFrom, Address? addressTo, int? typeId, num? deliveryFee, DateTime? deliveryDate, String? deliveryTime, String? phoneFrom, String? usernameFrom, bool? current, DateTime? createdAt, DateTime? updatedAt, num? km, Dyn deliveryman, Currency? currency, User? user, Dyn transaction, TypeModel? type, }) => ParcelOrder( id: id ?? this.id, userId: userId ?? this.userId, totalPrice: totalPrice ?? this.totalPrice, rate: rate ?? this.rate, status: status ?? this.status, note: note ?? this.note, phoneTo: phoneTo ?? this.phoneTo, usernameTo: usernameTo ?? this.usernameTo, addressFrom: addressFrom ?? this.addressFrom, addressTo: addressTo ?? this.addressTo, typeId: typeId ?? this.typeId, deliveryFee: deliveryFee ?? this.deliveryFee, deliveryDate: deliveryDate ?? this.deliveryDate, deliveryTime: deliveryTime ?? this.deliveryTime, phoneFrom: phoneFrom ?? this.phoneFrom, usernameFrom: usernameFrom ?? this.usernameFrom, current: current ?? this.current, createdAt: createdAt ?? this.createdAt, updatedAt: updatedAt ?? this.updatedAt, km: km ?? this.km, deliveryman: deliveryman ?? this.deliveryman, currency: currency ?? this.currency, user: user ?? this.user, transaction: transaction ?? this.transaction, type: type ?? this.type, ); factory ParcelOrder.fromJson(Map<String, Dyn> json)`
*No documentation provided (generation failed).*
