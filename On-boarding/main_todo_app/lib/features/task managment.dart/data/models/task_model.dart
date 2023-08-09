import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

class TaskModel extends ToDoTask {
  TaskModel(
      {required this.id, required this.title, this.description, this.deadline})
      : super(
            id: id, title: title, description: description, deadline: deadline);

  final id;
  final String title;
  final String? description;
  final DateTime? deadline;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        deadline: json["deadline"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "deadline": deadline
    };
  }
}
