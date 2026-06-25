import 'package:core_sdk/core_sdk.dart';
import 'package:processing_sdk/processing_sdk.dart';
import '../../models/data/task_model.dart';

class TaskService {
  final AppDatabase _database;
  final ProcessingEngine _processingEngine = ProcessingEngine();

  TaskService(this._database);

  /// Expose lifecycle state-changed events for tasks
  Stream<ProcessingStateChangedEvent> get taskEvents =>
      _processingEngine.eventStream;

  Future<List<TaskModel>> getTasks() async {
    final tasks = await _database.select(_database.tasksTable).get();
    return tasks.map((task) {
      if (task.data == null) return TaskModel.fromMap({});
      return TaskModel.fromJson(task.data!);
    }).toList();
  }

  Future<void> addTask(TaskModel task) async {
    await _database.into(_database.tasksTable).insert(
      _database.TasksTableCompanion.insert(
        id: task.id,
        title: task.title,
        description: task.description,
        isCompleted: task.isCompleted,
        dueDate: task.dueDate,
        createdAt: task.lastUpdated,
        updatedAt: task.lastUpdated,
        data: task.toJson(),
      ),
    );
  }

  Future<void> updateTask(TaskModel updatedTask) async {
    await _database.into(_database.tasksTable).insertOnConflictUpdate(
      _database.TasksTableCompanion.insert(
        id: updatedTask.id,
        title: updatedTask.title,
        description: updatedTask.description,
        isCompleted: updatedTask.isCompleted,
        dueDate: updatedTask.dueDate,
        updatedAt: updatedTask.lastUpdated,
        data: updatedTask.toJson(),
      ),
    );
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

    await updateTask(updatedTask);
    return updatedTask;
  }

  Future<void> deleteTask(String id) async {
    await (_database.delete(_database.tasksTable)..where((t) => t.id.equals(id))).go();
  }
}
