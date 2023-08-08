import '../../domain/entities/task.dart';

abstract class TaskLocalDataSource {
  List<ToDoTask> getTasks();
  ToDoTask getTask(int id);

  void createTask(ToDoTask task);
  ToDoTask updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline});
  void deleteTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  TaskLocalDataSourceImpl({required this.tasks});

  List<ToDoTask> tasks;

  @override
  void createTask(ToDoTask task) {
    tasks.add(ToDoTask(
        id: tasks.length,
        title: task.title,
        description: task.description,
        deadline: task.deadline));
  }

  @override
  void deleteTask(int id) {
    tasks.remove(tasks[id]);
  }

  @override
  ToDoTask getTask(int id) {
    return tasks[id];
  }

  @override
  List<ToDoTask> getTasks() {
    return tasks;
  }

  @override
  ToDoTask updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) {
    tasks[id] = ToDoTask(
        id: id,
        title: newTitle ?? tasks[id].title,
        description: description ?? tasks[id].description,
        deadline: newDeadline ?? tasks[id].deadline);
    return tasks[id];
  }
}
