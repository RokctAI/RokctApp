import 'package:drift/drift.dart';

@DataClassName('NotificationEntity')
class NotificationsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get data => text()();
  DateTimeColumn get readAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
