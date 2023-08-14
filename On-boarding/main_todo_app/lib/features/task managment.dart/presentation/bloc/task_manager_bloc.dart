import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:main_todo_app/core/network/network_info.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/datasources/task_local_data__source.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/create_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/delete_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/get_task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/get_tasks.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/use%20cases/update_task.dart';

import '../../domain/use cases/mark_task.dart';

part 'task_manager_event.dart';
part 'task_manager_state.dart';

List<ToDoTask> tasks = [];

class TaskManagerBloc extends Bloc<TaskManagerEvent, TaskManagerState> {
  TaskManagerBloc() : super(TaskManagerInitial()) {
    final InternetConnectionChecker connectionChecker =
        InternetConnectionChecker();

    final TaskLocalDataSource localDataSource =
        TaskLocalDataSourceImpl(tasks: tasks);

    final NetworkInfo networkInfo = NetworkInfoImpl(connectionChecker);

    final TaskRepositoryImpl repository = TaskRepositoryImpl(
        localDataSource: localDataSource, networkChecker: networkInfo);

    final GetTasks getTasks = GetTasks(repository);
    final GetTask getTask = GetTask(repository);

    final DeleteTask deleteTask = DeleteTask(repository);
    final UpdateTask updateTask = UpdateTask(repository);
    final MarkTask markTask = MarkTask(repository);
    final CreateTask createTask = CreateTask(repository);

    on<TaskManagerEvent>((event, emit) async {
      if (event is TasksRequested) {
        print("task requested");
        final response = await getTasks.call();
        List<ToDoTask>? tasks =
            response.isRight() ? response.getOrElse(() => []) : null;
        emit(LoadedTasks(tasks: tasks ?? []));
      } else if (event is TaskRequested) {
        final response = await getTask.call(event.task.id);
        ToDoTask task = response.isRight()
            ? response.getOrElse(() => ToDoTask.empty())
            : ToDoTask.empty();
        emit(TaskDetail(task: task));
      } else if (event is TaskAdded) {
        await createTask.call(event.task);
        final response = await getTasks.call();
        List<ToDoTask> tasks =
            response.isRight() ? response.getOrElse(() => []) : [];

        emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskDeleted) {
        deleteTask.call(event.task.id);
        final response = await getTasks.call();
        List<ToDoTask> tasks =
            response.isRight() ? response.getOrElse(() => []) : [];
        emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskMarked) {
        markTask.call(event.task);
        // emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskUpdated) {
        updateTask.call(
            id: event.id,
            newTitle: event.title,
            description: event.description,
            newDeadline: event.deadline);

        final response = await getTasks.call();
        List<ToDoTask> tasks =
            response.isRight() ? response.getOrElse(() => []) : [];

        emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskRequested) {
        final response = await getTask.call(event.task.id);
        ToDoTask task = response.isRight()
            ? response.getOrElse(() => ToDoTask.empty())
            : ToDoTask.empty();
        emit(TaskDetail(task: task));
      } else {
        emit(EmptyTasks());
      }
    });
  }
}
