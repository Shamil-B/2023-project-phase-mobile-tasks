import 'package:dartz/dartz.dart';
import 'package:main_todo_app/core/error/failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../repository/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  void call(int id) async {
    return repository.deleteTask(id);
  }
}
