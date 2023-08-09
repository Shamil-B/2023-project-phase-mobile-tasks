import 'package:dartz/dartz.dart';

import 'package:main_todo_app/core/error/failure.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/datasources/task_local_data__source.dart';

import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../../domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSourceImpl localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Either<Failure, ToDoTask> createTask(ToDoTask task) {
    try {
      localDataSource.createTask(task);
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Either<UnknownFailure, ToDoTask> deleteTask(int id) {
    try {
      localDataSource.deleteTask(id);
      return Right(ToDoTask(id: 0, title: ""));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Either<UnknownFailure, ToDoTask> getTask(int id) {
    try {
      final task = localDataSource.getTask(id);
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Either<UnknownFailure, List<ToDoTask>> getTasks() {
    try {
      final List<ToDoTask> tasks = localDataSource.getTasks();
      return Right(tasks);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Either<UnknownFailure, ToDoTask> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) {
    try {
      localDataSource.updateTask(
          id: id,
          newTitle: newTitle,
          description: description,
          newDeadline: newDeadline);
      return Right(ToDoTask(id: 0, title: ""));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Either<UnknownFailure, ToDoTask> markTask(ToDoTask task) {
    try {
      localDataSource.markTask(task);
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
