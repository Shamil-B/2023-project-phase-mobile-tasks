part of 'task_manager_bloc.dart';

sealed class TaskManagerEvent extends Equatable {
  const TaskManagerEvent();

  @override
  List<Object> get props => [];
}

class TaskAdded extends TaskManagerEvent {
  final ToDoTask task;
  const TaskAdded({required this.task});
}

class TaskDeleted extends TaskManagerEvent {
  final ToDoTask task;
  const TaskDeleted({required this.task});
}

class TaskUpdated extends TaskManagerEvent {
  final int id;
  final String? title;
  final String? description;
  final DateTime? deadline;
  const TaskUpdated(
      {required this.id, this.title, this.description, this.deadline});
}

class TaskRequested extends TaskManagerEvent {
  final ToDoTask task;
  const TaskRequested({required this.task});
}

class TasksRequested extends TaskManagerEvent {}

class TaskMarked extends TaskManagerEvent {
  final ToDoTask task;
  const TaskMarked({required this.task});
}
