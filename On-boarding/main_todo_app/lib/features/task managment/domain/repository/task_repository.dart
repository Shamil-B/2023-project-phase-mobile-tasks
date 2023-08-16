import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/failure.dart';

import '../entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<ToDoTask>>> getTasks();
  Future<Either<Failure, ToDoTask>> getTask(int id);
  Future<Either<Failure, ToDoTask>> createTask(ToDoTask task);
  Future<Either<Failure, ToDoTask>> markTask(ToDoTask task);
  Future<Either<Failure, ToDoTask>> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline});
  Future<Either<Failure, ToDoTask>> deleteTask(int id);
}
