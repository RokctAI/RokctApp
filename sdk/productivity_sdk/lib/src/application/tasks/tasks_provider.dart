import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'task_service.dart';

final taskServiceProvider = Provider<TaskService>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return TaskService(database);
});

final tasksStateProvider = StateNotifierProvider<TasksNotifier, List<TaskModel>>((ref) {
  final service = ref.watch(taskServiceProvider);
  return TasksNotifier(service);
});

class TasksNotifier extends StateNotifier<List<TaskModel>> {
  TasksNotifier(this._service) : super([]) {
    loadTasks();
  }

  final TaskService _service;

  Future<void> loadTasks() async {
    final tasks = await _service.getTasks();
    state = tasks;
  }

  Future<void> addTask(TaskModel task) async {
    await _service.addTask(task);
    await loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await _service.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await _service.deleteTask(id);
    await loadTasks();
  }

  Future<void> transitionTask(String id, ProcessingState newState) async {
    await _service.transitionTask(id, newState);
    await loadTasks();
  }
}
