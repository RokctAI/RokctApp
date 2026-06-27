import 'package:drift/drift.dart';

@DataClassName('EventQueueEntity')
class EventQueueTable extends Table {
  TextColumn get id => text()();
  TextColumn get source => text()();
  TextColumn get eventType => text()();
  TextColumn get entityId => text()();
  TextColumn get entityType => text()();
  TextColumn get payload => text()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SyncQueueEntity')
class SyncQueueTable extends Table {
  TextColumn get id => text().clientDefault(() => '')();
  TextColumn get url => text()();
  TextColumn get method => text()();
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AbandonedSyncQueueEntity')
class AbandonedSyncQueueTable extends Table {
  TextColumn get id => text()();
  TextColumn get url => text()();
  TextColumn get method => text()();
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get abandonedAt => dateTime()();
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SettingEntity')
class SettingsTable extends Table {
  TextColumn get id => text()();
  TextColumn get data => text()();

  @override
  Set<Column> get primaryKey => {id};
}
