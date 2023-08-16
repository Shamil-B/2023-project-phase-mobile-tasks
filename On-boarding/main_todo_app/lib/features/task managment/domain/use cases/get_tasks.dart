import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';

import '../../../../core/error/failure.dart';
import '../repository/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<Either<UnknownFailure, List<ToDoTask>>> call() async {
    final tasks = await repository.getTasks();
    if (tasks.isRight()) {
      final tmpTasks = tasks.getOrElse(() => []);
      return Right(tmpTasks);
    } else {
      return Left(UnknownFailure());
    }
  }
}
