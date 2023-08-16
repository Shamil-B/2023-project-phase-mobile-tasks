part of 'task_manager_bloc.dart';

sealed class TaskManagerState extends Equatable {
  const TaskManagerState();

  @override
  List<Object> get props => [];
}

final class TaskManagerInitial extends TaskManagerState {}

class EmptyTasks extends TaskManagerState {}

class LoadedTasks extends TaskManagerState {
  final List<ToDoTask> tasks;
  const LoadedTasks({required this.tasks});
}

class TaskDetail extends TaskManagerState {
  final ToDoTask task;
  const TaskDetail({required this.task});
}

class Error extends TaskManagerState {
  final String message;
  const Error({required this.message});
}

class Loading extends TaskManagerState {}
