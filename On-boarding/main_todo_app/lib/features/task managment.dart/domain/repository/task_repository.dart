import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/failure.dart';

import '../entities/task.dart';

abstract class TaskRepository {
  Either<Failure, List<ToDoTask>> getTasks();
  Either<Failure, ToDoTask> getTask(int id);
  Either<Failure, ToDoTask> createTask(ToDoTask task);
  Either<Failure, ToDoTask> markTask(ToDoTask task);
  Either<Failure, ToDoTask> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline});
  Either<Failure, ToDoTask> deleteTask(int id);
}
