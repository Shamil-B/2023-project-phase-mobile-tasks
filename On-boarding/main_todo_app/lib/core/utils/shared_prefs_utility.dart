import 'package:main_todo_app/features/task%20managment.dart/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../features/task managment.dart/domain/entities/task.dart';

Future<void> saveTaskList(List<ToDoTask> taskList, String key) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> tasksEncoded = [];

  for (ToDoTask task in taskList) {
    String eTask =
        "${task.id}#${(task.title != "") ? task.title : ""}#${task.description ?? '-1'}#${task.deadline ?? '-1'}#${task.isDone}";

    tasksEncoded.add(eTask);
  }
  prefs.setStringList(key, tasksEncoded);
}

Future<List<ToDoTask>> loadTaskList(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final tasksEncoded = prefs.getStringList(key);
  List<ToDoTask> tasks = [];

  if (tasksEncoded != null) {
    for (String eTask in tasksEncoded) {
      final list = eTask.split("#");
      ToDoTask task = ToDoTask(
          id: int.parse(list[0]),
          title: list[1],
          description: (list[2] == "-1") ? "" : list[2],
          deadline:
              (list[3] == "-1") ? DateTime.now() : DateTime.parse(list[3]),
          isDone: (list[4] == "true") ? true : false);

      tasks.add(task);
    }

    return tasks;
  }

  return [];
}
