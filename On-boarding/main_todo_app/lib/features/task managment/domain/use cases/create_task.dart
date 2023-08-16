import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment/data/repository/task_repository_implementation.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repository/task_repository.dart';

class CreateTask {
  final TaskRepository repository;

  CreateTask(this.repository);

  Future<Either<UnknownFailure, ToDoTask>> call(ToDoTask newTask) async {
    final response = await repository.createTask(newTask);

    if (response.isRight()) {
      return Right(newTask);
    } else {
      return Left(UnknownFailure());
    }
  }
}
