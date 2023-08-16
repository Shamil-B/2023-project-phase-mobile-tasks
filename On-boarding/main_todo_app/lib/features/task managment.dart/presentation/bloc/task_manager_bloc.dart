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
import 'package:main_todo_app/injection_conainer.dart';

import '../../domain/repository/task_repository.dart';
import '../../domain/use cases/mark_task.dart';

part 'task_manager_event.dart';
part 'task_manager_state.dart';

List<ToDoTask> tasks = [];

class TaskManagerBloc extends Bloc<TaskManagerEvent, TaskManagerState> {
  TaskManagerBloc() : super(TaskManagerInitial()) {
    final GetTasks getTasks = sl();
    final GetTask getTask = sl();

    final DeleteTask deleteTask = sl();
    final UpdateTask updateTask = sl();
    final MarkTask markTask = sl();
    final CreateTask createTask = sl();

    on<TaskManagerEvent>((event, emit) async {
      if (event is TasksRequested) {
        emit(Loading());
        final response = await getTasks.call();

        response.fold(
            (failure) => emit(const Error(message: "Error getting tasks")),
            (tasks) => emit(LoadedTasks(tasks: tasks)));
      } else if (event is TaskRequested) {
        emit(Loading());
        final response = await getTask.call(event.task.id);
        response.fold(
            (failure) => emit(const Error(message: "Error getting task")),
            (task) => emit(TaskDetail(task: task)));
      } else if (event is TaskAdded) {
        emit(Loading());
        final task = await createTask.call(event.task);
        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error creating task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        }
      } else if (event is TaskDeleted) {
        emit(Loading());
        final task = await deleteTask.call(event.task.id);
        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error deleting task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        }
      } else if (event is TaskMarked) {
        await markTask.call(event.task);
      } else if (event is TaskUpdated) {
        emit(Loading());
        final task = await updateTask.call(
            id: event.id,
            title: event.title,
            description: event.description,
            newDeadline: event.deadline);

        if (task.isRight()) {
          final response = await getTasks.call();
          response.fold(
              (failure) => emit(const Error(message: "Error updating task")),
              (tasks) => emit(LoadedTasks(tasks: tasks)));
        } else {
          emit(const Error(message: "Error updating task"));
        }
      } else if (event is TaskRequested) {
        emit(Loading());
        final response = await getTask.call(event.task.id);
        response.fold(
            (failure) => emit(const Error(message: "Error getting task")),
            (task) => emit(TaskDetail(task: task)));
      } else {
        emit(EmptyTasks());
      }
    });
  }
}
