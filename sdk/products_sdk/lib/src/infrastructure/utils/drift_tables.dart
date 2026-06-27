import 'package:drift/drift.dart';

@DataClassName('ProductEntity')
class ProductsTable extends Table {
  TextColumn get id => text().clientDefault(() => '')();
  TextColumn get title => text().nullable()();
  TextColumn get barcode => text().nullable()();
  TextColumn get categoryId => text().nullable()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  TextColumn get img => text().nullable()();
  TextColumn get unitId => text().nullable()();
  BoolColumn get isPack => boolean().withDefault(const Constant(false))();
  TextColumn get parentId => text().nullable()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('StockEntity')
class StocksTable extends Table {
  TextColumn get id => text().clientDefault(() => '')();
  TextColumn get productUuid => text().nullable()();
  RealColumn get price => real().nullable()();
  RealColumn get costPrice => real().nullable()();
  IntColumn get quantity => integer().nullable()();
  TextColumn get sku => text().nullable()();
  TextColumn get data => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CategoryEntity')
class CategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}
