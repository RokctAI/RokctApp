import 'package:drift/drift.dart';

@DataClassName('BannerEntity')
class BannersTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}
