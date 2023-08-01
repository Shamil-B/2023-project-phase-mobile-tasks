class Task {
  late String title;
  late String description;
  late String dueDate;
  late bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  void updateTask({
    String? title,
    String? description,
    String? dueDate,
    bool? isCompleted,
  }) {
    if (title != null) {
      this.title = title;
    }
    if (description != null) {
      this.description = description;
    }
    if (dueDate != null) {
      this.dueDate = dueDate;
    }
    if (isCompleted != null) {
      this.isCompleted = isCompleted;
    }
  }
}
