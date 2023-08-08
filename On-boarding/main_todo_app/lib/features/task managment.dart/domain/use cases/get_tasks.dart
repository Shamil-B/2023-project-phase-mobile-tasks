import 'package:dartz/dartz.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../../../../core/error/failure.dart';
import '../repository/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  List<ToDoTask> call() {
    return repository.getTasks();
  }
}
