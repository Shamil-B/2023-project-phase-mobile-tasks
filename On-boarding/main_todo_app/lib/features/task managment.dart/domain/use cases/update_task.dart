import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/repository/task_repository.dart';

import '../../../../core/error/failure.dart';

class UpdateTask {
  UpdateTask(
    this.repository,
  );

  TaskRepositoryImpl repository;

  Either<UnknownFailure, ToDoTask> call(
          {required int id,
          String? newTitle,
          String? description,
          DateTime? newDeadline}) =>
      repository.updateTask(
        id: id,
        newTitle: newTitle,
        description: description,
        newDeadline: newDeadline,
      );
}
