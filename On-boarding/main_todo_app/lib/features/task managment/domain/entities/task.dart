class ToDoTask {
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
}
