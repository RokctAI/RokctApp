import 'package:drift/drift.dart';

@DataClassName('TaskEntity')
class TasksTable extends Table {
  TextColumn get id => text().clientDefault(() => '')(); // UUID
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(const Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime().withDefault(const Constant(DateTime.now()))();
  TextColumn get createdBy => text().nullable()();
  TextColumn get data => text().nullable()(); // JSON blob fallback

  @override
  Set<Column> get primaryKey => {id};
}
