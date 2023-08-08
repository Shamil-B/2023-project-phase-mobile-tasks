import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/failure.dart';

import '../entities/task.dart';

abstract class TaskRepository {
  List<ToDoTask> getTasks();
  ToDoTask getTask(int id);
  ToDoTask createTask(ToDoTask task);
  ToDoTask updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline});
  void deleteTask(int id);
}
