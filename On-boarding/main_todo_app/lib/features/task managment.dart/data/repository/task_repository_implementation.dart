import 'package:dartz/dartz.dart';

import 'package:main_todo_app/core/error/failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/datasources/task_local_data__source.dart';

import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../../domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSourceImpl localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  ToDoTask createTask(ToDoTask task) {
    localDataSource.createTask(task);
    return task;
  }

  @override
  void deleteTask(int id) {
    localDataSource.deleteTask(id);
  }

  @override
  ToDoTask getTask(int id) {
    return localDataSource.getTask(id);
  }

  @override
  List<ToDoTask> getTasks() {
    return localDataSource.getTasks();
  }

  @override
  ToDoTask updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) {
    return localDataSource.updateTask(
        id: id,
        newTitle: newTitle,
        description: description,
        newDeadline: newDeadline);
  }
}
