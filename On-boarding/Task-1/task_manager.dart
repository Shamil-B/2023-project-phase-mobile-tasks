import "./task.dart";

class TaskManager {
  TaskManager();

  List<Task> tasks = [];

  void createTask({
    required String title,
    required String description,
    required String dueDate,
    bool isCompleted = false,
  }) {
    final task = Task(
      title: title,
      description: description,
      dueDate: dueDate,
      isCompleted: isCompleted,
    );
    addTask(task);
  }

  void addTask(Task task) {
    tasks.add(task);
    print("\n###### Task added successfully ######");
  }

  void deleteTask(String targetTitle) {
    Task task =
        tasks.firstWhere((task) => task.title == targetTitle, orElse: () {
      return Task(title: "", description: "", dueDate: "");
    });

    if (task.title == "") {
      print("\n###### Task not found ######");
      return;
    }
    tasks.remove(task);
    print("\n###### Task deleted successfully ######");
  }

  void editTask(
    String targetTitle, {
    String? title,
    String? description,
    String? dueDate,
    bool? isCompleted,
  }) {
    Task task =
        tasks.firstWhere((task) => task.title == targetTitle, orElse: () {
      return Task(title: "", description: "", dueDate: "");
    });

    if (task.title == "") {
      print("\n###### Task not found ######");
      return;
    }

    task.updateTask(
      title: title,
      description: description,
      dueDate: dueDate,
      isCompleted: isCompleted,
    );

    print("\n###### Task edited successfully ######");
  }

  void viewAllTasks() {
    if (tasks.length == 0) {
      print("###### There are no tasks ######");
      return;
    }
    print("All Tasks:");
    tasks.forEach((task) {
      print("   Title: " + task.title);
      print("   Description: " + task.description);
      print("   Due Date: " + task.dueDate);
      print("   Status: " +
          ((task.isCompleted) ? "Completed" : "Pending") +
          "\n");
    });
  }

  void viewCompletedTasks() {
    if (tasks.length == 0) {
      print("###### There are no completed tasks ######");
      return;
    }
    print("Completed Tasks:");
    tasks.forEach((task) {
      if (task.isCompleted) {
        print("   Title " + task.title);
        print("   Description " + task.description);
        print("   Due Date " + task.dueDate);
        print("   Status" +
            ((task.isCompleted) ? "Completed" : "Pending") +
            "\n");
      }
    });
  }

  void viewPendingTasks() {
    if (tasks.length == 0) {
      print("###### There are no pending tasks ######");
      return;
    }
    print("Pending Tasks:");
    tasks.forEach((task) {
      if (!task.isCompleted) {
        print("   Title " + task.title);
        print("   Description " + task.description);
        print("   Due Date " + task.dueDate);
        print("   Status" +
            ((task.isCompleted) ? "Completed" : "Pending") +
            "\n");
      }
    });
  }
}
