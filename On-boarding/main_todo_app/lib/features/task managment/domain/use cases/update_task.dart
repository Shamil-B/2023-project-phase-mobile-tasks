import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';
import 'package:main_todo_app/features/task%20managment/domain/repository/task_repository.dart';

import '../../../../core/error/failure.dart';

class UpdateTask {
  UpdateTask(
    this.repository,
  );

  TaskRepositoryImpl repository;

  Future<Either<UnknownFailure, ToDoTask>> call(
      {required int id,
      String? title,
      String? description,
      DateTime? newDeadline}) async {
    final response = await repository.updateTask(
      id: id,
      newTitle: title,
      description: description,
      newDeadline: newDeadline,
    );

    return response.fold(
      (failure) => Left(UnknownFailure()),
      (task) {
        return Right(task);
      },
    );
  }
}
