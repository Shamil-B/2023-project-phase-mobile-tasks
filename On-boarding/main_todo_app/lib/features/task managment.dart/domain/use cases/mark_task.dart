import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repository/task_repository.dart';

class MarkTask {
  final TaskRepositoryImpl repository;

  MarkTask(this.repository);

  Future<Either<UnknownFailure, ToDoTask>> call(ToDoTask task) async {
    final response = await repository.markTask(task);
    if (response.isRight()) {
      return Right(task);
    } else {
      return Left(UnknownFailure());
    }
  }
}
