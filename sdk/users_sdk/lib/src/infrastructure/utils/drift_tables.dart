import 'package:drift/drift.dart';

@DataClassName('UserEntity')
class UserTable extends Table {
  TextColumn get id => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get role => text().nullable()();
  TextColumn get password => text().nullable()();
  TextColumn get data => text()();
  DateTimeColumn get lastLogin => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
