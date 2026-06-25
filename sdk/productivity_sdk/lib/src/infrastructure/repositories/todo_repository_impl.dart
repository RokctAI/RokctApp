import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:uuid/uuid.dart';
import '../../domain/interface/todo_repository_facade.dart';

class TodoRepositoryImpl implements TodoRepositoryFacade {
  final AppDatabase _database;

  TodoRepositoryImpl(this._database);

  @override
  Future<List<Map<String, dynamic>>> loadTodos() async {
    try {
      final tasks = await _database.select(_database.tasksTable).get();
      return tasks.map((task) => {
        'id': task.id,
        'title': task.title,
        'description': task.description,
        'isDone': task.isCompleted,
        'deadline': task.dueDate?.toIso8601String(),
        'createdAt': task.createdAt.toIso8601String(),
        'updatedAt': task.updatedAt.toIso8601String(),
        'createdBy': task.createdBy,
        'data': task.data,
      }).toList();
    } catch (e) {
      debugPrint('Error loading todos: $e');
    }
    return [];
  }

  @override
  Future<void> saveTodos(List<Map<String, dynamic>> todos) async {
    try {
      await _database.transaction(() async {
        for (final todo in todos) {
          await _database.into(_database.tasksTable).insertOnConflictUpdate(
            _database.TasksTableCompanion.insert(
              id: Value(todo['id'] ?? const Uuid().v4()),
              title: Value(todo['title'] ?? ''),
              description: Value(todo['description']),
              isCompleted: Value(todo['isDone'] ?? false),
              dueDate: Value(todo['deadline'] != null 
                ? DateTime.tryParse(todo['deadline']) 
                : null),
              createdAt: Value(todo['createdAt'] != null 
                ? DateTime.tryParse(todo['createdAt']) 
                : DateTime.now()),
              updatedAt: Value(DateTime.now()),
              createdBy: Value(todo['createdBy']),
              data: Value(jsonEncode(todo)),
            ),
          );
        }
      });
    } catch (e) {
      debugPrint('Error saving todos: $e');
    }
  }

  @override
  Future<void> exportTodos(List<Map<String, dynamic>> todos) async {

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/todos_backup.json');
      await file.writeAsString(json.encode(todos));
      await Share.shareXFiles([XFile(file.path)], text: 'My Todo Backup');
    } catch (e) {
      debugPrint('Error exporting data: $e');
    }
  }
}
