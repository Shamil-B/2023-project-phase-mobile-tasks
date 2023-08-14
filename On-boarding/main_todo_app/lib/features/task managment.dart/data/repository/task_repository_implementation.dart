import 'package:dartz/dartz.dart';

import 'package:main_todo_app/core/error/failure.dart';
import 'package:main_todo_app/core/error/unknown_failure.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/datasources/task_local_data__source.dart';

import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';
import 'package:main_todo_app/core/network/network_info.dart';

import '../../domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkChecker;

  TaskRepositoryImpl(
      {required this.localDataSource, required this.networkChecker});

  @override
  Future<Either<Failure, ToDoTask>> createTask(ToDoTask task) async {
    try {
      networkChecker.isConnected.then((isConnected) async {
        if (!isConnected) {
          await localDataSource.createTask(task);
        } else {
          await localDataSource.createTask(task);
        }
      });
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<UnknownFailure, ToDoTask>> deleteTask(int id) async {
    try {
      await localDataSource.deleteTask(id);
      return Right(ToDoTask(id: 0, title: ""));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<UnknownFailure, ToDoTask>> getTask(int id) async {
    try {
      final task = await localDataSource.getTask(id);
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<UnknownFailure, List<ToDoTask>>> getTasks() async {
    try {
      final tasks = await localDataSource.getTasks();
      return Right(tasks);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<UnknownFailure, ToDoTask>> updateTask(
      {required int id,
      String? newTitle,
      String? description,
      DateTime? newDeadline}) async {
    try {
      await localDataSource.updateTask(
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
  Future<Either<UnknownFailure, ToDoTask>> markTask(ToDoTask task) async {
    try {
      await localDataSource.markTask(task);
      return Right(task);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
