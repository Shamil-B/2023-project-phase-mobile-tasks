import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/datasources/task_local_data__source.dart';
import 'package:main_todo_app/features/task%20managment.dart/data/repository/task_repository_implementation.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/repository/task_repository.dart';
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
    final TaskLocalDataSourceImpl localDataSource =
        TaskLocalDataSourceImpl(tasks: tasks);
    final TaskRepositoryImpl repository =
        TaskRepositoryImpl(localDataSource: localDataSource);

    final GetTasks getTasks = GetTasks(repository);
    final GetTask getTask = GetTask(repository);

    final DeleteTask deleteTask = DeleteTask(repository);
    final UpdateTask updateTask = UpdateTask(repository);
    final MarkTask markTask = MarkTask(repository);
    final CreateTask createTask = CreateTask(repository);

    on<TaskManagerEvent>((event, emit) {
      if (event is TasksRequested) {
        List<ToDoTask>? tasks = getTasks.call().isRight()
            ? getTasks.call().getOrElse(() => [])
            : null;
        emit(LoadedTasks(tasks: tasks ?? []));
      } else if (event is TaskRequested) {
        ToDoTask task = getTask.call(event.task.id).isRight()
            ? getTask.call(event.task.id).getOrElse(() => ToDoTask.empty())
            : ToDoTask.empty();
        emit(TaskDetail(task: task));
      } else if (event is TaskAdded) {
        createTask.call(event.task);
        List<ToDoTask> tasks = getTasks.call().isRight()
            ? getTasks.call().getOrElse(() => [])
            : [];
        emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskDeleted) {
        deleteTask.call(event.task.id);
        List<ToDoTask> tasks = getTasks.call().isRight()
            ? getTasks.call().getOrElse(() => [])
            : [];
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
        List<ToDoTask> tasks = getTasks.call().isRight()
            ? getTasks.call().getOrElse(() => [])
            : [];
        emit(LoadedTasks(tasks: tasks));
      } else if (event is TaskRequested) {
        ToDoTask task = getTask.call(event.task.id).isRight()
            ? getTask.call(event.task.id).getOrElse(() => ToDoTask.empty())
            : ToDoTask.empty();
        emit(TaskDetail(task: task));
      } else {
        emit(EmptyTasks());
      }
    });
  }
}
