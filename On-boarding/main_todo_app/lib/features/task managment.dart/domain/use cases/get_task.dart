import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../../../../core/error/failure.dart';
import '../repository/task_repository.dart';

class GetTask {
  final TaskRepositoryImpl repository;

  GetTask(this.repository);

  Either<UnknownFailure, ToDoTask> call(int id) {
    final result = repository.getTask(id);
    if (result.isRight()) {
      return Right(result);
    } else {
      return Left(UnknownFailure());
    }
  }
}
