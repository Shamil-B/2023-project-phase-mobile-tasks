import 'package:dartz/dartz.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';

import '../../../../core/error/unknown_failure.dart';
import '../repository/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<Either<UnknownFailure, ToDoTask>> call(int id) async {
    final response = await repository.deleteTask(id);
    if (response.isRight()) {
      return Right(ToDoTask(id: 0, title: ""));
    } else {
      return Left(UnknownFailure());
    }
  }
}
