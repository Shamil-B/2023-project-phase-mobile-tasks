import 'package:main_todo_app/core/utils/shared_prefs_utility.dart';
import 'package:main_todo_app/core/utils/shared_prefs_utility.dart';
import '../../domain/entities/task.dart';

abstract class TaskLocalDataSource {
  Future<List<ToDoTask>> getTasks();
  Future<ToDoTask> getTask(int id);

  Future<void> createTask(ToDoTask task);
  Future<void> markTask(ToDoTask task);
  Future<void> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline});
  Future<void> deleteTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  TaskLocalDataSourceImpl({required this.tasks});

  List<ToDoTask> tasks;

  @override
  Future<void> createTask(ToDoTask task) async {
    try {
      List<ToDoTask> tasks = await loadTaskList('tasks');
      tasks.add(ToDoTask(
        id: tasks.length,
        title: task.title,
        description: task.description,
        deadline: task.deadline,
      ));
      await saveTaskList(tasks, 'tasks');
    } catch (e) {
      print("Error in saving: $e");
    }
  }

  @override
  Future<void> deleteTask(int id) {
    loadTaskList('tasks').then((List<ToDoTask> tasks) {
      tasks.remove(tasks[id]);
      saveTaskList(tasks, 'tasks').then((value) => null);
    });
    throw ("Error in deleting task");
  }

  @override
  Future<ToDoTask> getTask(int id) {
    loadTaskList('tasks').then((List<ToDoTask> tasks) {
      return tasks[id];
    });
    throw ("error occured in getting task");
  }

  @override
  Future<List<ToDoTask>> getTasks() async {
    List<ToDoTask> tasks = await loadTaskList('tasks');
    return tasks;
  }

  @override
  Future<void> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) async {
    tasks = await loadTaskList('tasks');

    tasks[id] = ToDoTask(
        id: id,
        title: newTitle ?? tasks[id].title,
        description: description ?? tasks[id].description,
        deadline: newDeadline ?? tasks[id].deadline);

    await saveTaskList(tasks, 'tasks');
  }

  @override
  Future<void> markTask(ToDoTask task) async {
    tasks = await loadTaskList('tasks');
    tasks[task.id] = ToDoTask(
        id: task.id,
        title: task.title,
        description: task.description,
        deadline: task.deadline,
        isDone: !task.isDone);
    await saveTaskList(tasks, 'tasks');
  }
}
