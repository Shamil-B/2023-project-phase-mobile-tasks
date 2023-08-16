import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/repository/task_repository.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/create_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/delete_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/get_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/get_tasks.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/mark_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/update_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/presentation/bloc/task_manager_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/task managment.dart/data/datasources/task_local_data__source.dart';
import 'features/task managment.dart/domain/entities/task.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Task Management
  // Bloc
  sl.registerFactory(() => TaskManagerBloc());

  // Use cases
  sl.registerLazySingleton(() => GetTask(sl()));
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => CreateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => MarkTask(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(localDataSource: sl(), networkChecker: sl()));
  sl.registerLazySingleton(
      () => TaskRepositoryImpl(localDataSource: sl(), networkChecker: sl()));

  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl(tasks: sl()));

  // classes
  sl.registerLazySingleton(() => <ToDoTask>[]);

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
