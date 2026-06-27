import 'package:drift/drift.dart';

@DataClassName('OrderEntity')
class OrdersTable extends Table {
  TextColumn get id => text().clientDefault(() => '')();
  TextColumn get shopId => text().nullable()();
  RealColumn get totalPrice => real().nullable()();
  RealColumn get totalCost => real().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get paymentType => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OrderItemEntity')
class OrderItemsTable extends Table {
  TextColumn get id => text().clientDefault(() => '')();
  TextColumn get orderId => text()();
  TextColumn get productId => text().nullable()();
  TextColumn get stockId => text().nullable()();
  IntColumn get quantity => integer().nullable()();
  RealColumn get price => real().nullable()();
  RealColumn get costPrice => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BillingCartEntity')
class BillingCartTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}
