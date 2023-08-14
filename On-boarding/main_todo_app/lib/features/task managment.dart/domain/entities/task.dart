import 'package:equatable/equatable.dart';

class ToDoTask implements Equatable {
  final int id;
  final String title;
  final String? description;
  final DateTime? deadline;
  bool isDone;

  ToDoTask({
    required this.id,
    required this.title,
    this.description,
    this.deadline,
    this.isDone = false,
  });

  factory ToDoTask.empty() {
    return ToDoTask(id: 0, title: "");
  }

  @override
  List<Object?> get props => [id, title, description, deadline, isDone];

  @override
  bool? get stringify => true;
}
