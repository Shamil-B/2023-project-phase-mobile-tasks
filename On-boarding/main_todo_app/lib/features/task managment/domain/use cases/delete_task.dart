import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../../../../core/error/unknown_failure.dart';
import '../repository/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Either<UnknownFailure, ToDoTask> call(int id) {
    if (repository.deleteTask(id).isRight()) {
      return Right(ToDoTask(id: 0, title: ""));
    } else {
      return Left(UnknownFailure());
    }
  }
}
