import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/interface/todo_repository_facade.dart';

class TodoRepositoryImpl implements TodoRepositoryFacade {
  static const String _todosKey = 'todos';

  @override
  Future<List<Map<String, dynamic>>> loadTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? todosString = prefs.getString(_todosKey);

      if (todosString != null) {
        return List<Map<String, dynamic>>.from(json.decode(todosString));
      }
    } catch (e) {
      debugPrint('Error loading todos: $e');
    }
    return [];
  }

  @override
  Future<void> saveTodos(List<Map<String, dynamic>> todos) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_todosKey, json.encode(todos));
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
