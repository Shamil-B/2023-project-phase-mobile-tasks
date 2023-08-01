import "dart:io";

import "./task_manager.dart";

void main() {
  TaskManager taskManager = TaskManager();

  print("Welcome to Task Manager. Choose what you want to do");
  print(
      "1. Add a new task \n2. View all tasks \n3. View only completed tasks\n4. View only pending tasks\n5. Delete a task \n6. Edit a task (update title, description, due date, or status) \n0. Exit");
  while (true) {
    print("\nEnter your Choice: ");
    final choice = int.parse(stdin.readLineSync()!);
    print("");

    if (choice == 0) {
      break;
    }

    switch (choice) {
      case 1:
        print("Enter title: ");
        final title = stdin.readLineSync()!;
        print("Enter description: ");
        final description = stdin.readLineSync()!;
        print("Enter due date: ");
        final dueDate = stdin.readLineSync()!;
        print("Is the task completed? y/n: ");
        final status = stdin.readLineSync()!;
        taskManager.createTask(
          title: title,
          description: description,
          dueDate: dueDate,
          isCompleted: status == "y" ? true : false,
        );
        break;
      case 2:
        taskManager.viewAllTasks();
        break;
      case 3:
        taskManager.viewCompletedTasks();
        break;
      case 4:
        taskManager.viewPendingTasks();
        break;
      case 5:
        print("Enter title of task to delete: ");
        final title = stdin.readLineSync()!;
        taskManager.deleteTask(title);
        break;
      case 6:
        print("Enter title of task to edit: ");
        final title = stdin.readLineSync()!;
        print("Enter new title: ");
        final newTitle = stdin.readLineSync()!;
        print("Enter new description: ");
        final newDescription = stdin.readLineSync()!;
        print("Enter new due date: ");
        final newDueDate = stdin.readLineSync()!;
        print("Is the task completed? y/n: ");
        final newStatus = stdin.readLineSync()!;
        taskManager.editTask(
          title,
          title: newTitle,
          description: newDescription,
          dueDate: newDueDate,
          isCompleted: newStatus == "y" ? true : false,
        );
        break;
      default:
        print("Invalid choice");
    }
  }
}
