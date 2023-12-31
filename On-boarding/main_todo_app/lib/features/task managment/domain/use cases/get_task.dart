import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';

import '../../../../core/error/failure.dart';
import '../repository/task_repository.dart';

class GetTask {
  final TaskRepositoryImpl repository;

  GetTask(this.repository);

  Future<Either<UnknownFailure, ToDoTask>> call(int id) async {
    final result = await repository.getTask(id);
    if (result.isRight()) {
      return Right(result.getOrElse(() => ToDoTask(id: 0, title: "")));
    } else {
      return Left(UnknownFailure());
    }
  }
}
