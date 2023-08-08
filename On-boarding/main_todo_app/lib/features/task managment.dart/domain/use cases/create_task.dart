import 'package:dartz/dartz.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repository/task_repository.dart';

class CreateTask {
  final TaskRepositoryImpl repository;

  CreateTask(this.repository);

  ToDoTask call(ToDoTask newTask) {
    return repository.createTask(newTask);
  }
}
