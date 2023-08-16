import 'package:main_todo_app/core/utils/shared_prefs_utility.dart';
import 'package:main_todo_app/core/utils/shared_prefs_utility.dart';
import '../../domain/entities/task.dart';

abstract class TaskLocalDataSource {
  Future<List<ToDoTask>> getTasks();
  Future<ToDoTask> getTask(int id);

  Future<ToDoTask> createTask(ToDoTask task);
  Future<void> markTask(ToDoTask task);
  Future<ToDoTask> updateTask(
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
  Future<ToDoTask> createTask(ToDoTask task) async {
    try {
      List<ToDoTask> tasks = await loadTaskList('tasks');

      tasks.add(ToDoTask(
        id: tasks.length,
        title: task.title,
        description: task.description,
        deadline: task.deadline,
      ));

      await saveTaskList(tasks, 'tasks');
      return tasks.last;
    } catch (e) {
      print("Error in saving: $e");
    }
    throw ("Error in saving task");
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      List<ToDoTask> tasks = await loadTaskList('tasks');
      for (int i = 0; i < tasks.length; i++) {
        if (tasks[i].id == id) {
          tasks.removeAt(i);
          break;
        }
      }
      await saveTaskList(tasks, 'tasks');
    } catch (e) {
      print("Error in saving: $e");
    }
  }

  @override
  Future<ToDoTask> getTask(int id) async {
    try {
      final tasks = await loadTaskList('tasks');
      return tasks[id];
    } catch (e) {
      print("Error in getting task: $e");
    }
    throw ("Error in getting task");
  }

  @override
  Future<List<ToDoTask>> getTasks() async {
    List<ToDoTask> tasks = await loadTaskList('tasks');
    return tasks;
  }

  @override
  Future<ToDoTask> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) async {
    tasks = await loadTaskList('tasks');
    int i = 0;

    for (i; i < tasks.length; i++) {
      if (tasks[i].id == id) {
        tasks[i] = ToDoTask(
            id: id,
            title: newTitle ?? tasks[id].title,
            description: description ?? tasks[id].description,
            deadline: newDeadline ?? tasks[id].deadline);
        break;
      }
    }
    await saveTaskList(tasks, 'tasks');
    return tasks[i];
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
