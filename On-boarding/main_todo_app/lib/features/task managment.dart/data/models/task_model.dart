import 'package:equatable/equatable.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

class TaskModel extends ToDoTask implements Equatable {
  TaskModel(
      {required this.id,
      required this.title,
      this.description,
      this.deadline,
      this.isDone = false})
      : super(
            id: id,
            title: title,
            description: description,
            deadline: deadline,
            isDone: isDone);

  @override
  final int id;
  final String title;
  final String? description;
  final DateTime? deadline;
  final bool isDone;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isDone: json["isDone"],
        deadline: json["deadline"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "deadline": deadline,
      "isDone": isDone
    };
  }

  @override
  List<Object?> get props => [id, title, description, deadline, isDone];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          other.id == id &&
          other.title == title &&
          other.description == description &&
          other.isDone == isDone &&
          other.deadline == deadline;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isDone.hashCode ^
      deadline.hashCode;
}
