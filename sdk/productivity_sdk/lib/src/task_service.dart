import 'package:shared_preferences/shared_preferences.dart';
import 'package:processing_sdk/processing_sdk.dart';
import 'task_model.dart';

class TaskService {
  static const String _tasksKey = 'persisted_tasks';
  final ProcessingEngine _processingEngine = ProcessingEngine();

  /// Expose lifecycle state-changed events for tasks
  Stream<ProcessingStateChangedEvent> get taskEvents =>
      _processingEngine.eventStream;

  Future<List<TaskModel>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString(_tasksKey);
    if (tasksJson == null) return [];
    return TaskModel.decodeList(tasksJson);
  }

  Future<void> addTask(TaskModel task) async {
    final tasks = await getTasks();
    tasks.add(task);
    await _saveTasks(tasks);
  }

  Future<void> updateTask(TaskModel updatedTask) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await _saveTasks(tasks);
    }
  }

  /// Transitions a task to a new state using the state machine engine
  Future<TaskModel> transitionTask(String id, ProcessingState newState) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == id);
    if (index == -1) {
      throw ArgumentError('Task with ID $id not found.');
    }

    final currentTask = tasks[index];
    final transitionedContract = _processingEngine.transition(
      currentTask,
      newState,
    );

    final updatedTask = currentTask.copyWith(
      status: transitionedContract.currentState,
      lastUpdated: transitionedContract.updatedAt,
    );

    tasks[index] = updatedTask;
    await _saveTasks(tasks);
    return updatedTask;
  }

  Future<void> deleteTask(String id) async {
    final tasks = await getTasks();
    tasks.removeWhere((t) => t.id == id);
    await _saveTasks(tasks);
  }

  Future<void> _saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tasksKey, TaskModel.encodeList(tasks));
  }
}
