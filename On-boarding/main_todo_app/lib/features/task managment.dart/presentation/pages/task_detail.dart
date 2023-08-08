import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';

import '../bloc/task_manager_bloc.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({required this.task, super.key});
  final ToDoTask task;

  @override
  Widget build(BuildContext context) {
    List<Widget> tasks = [
      TaskField(title: task.title, label: "Title"),
      TaskField(
        title:
            task.description == null ? "no description set" : task.description!,
        label: "Description",
      ),
      TaskField(
        title: (task.deadline != null)
            ? ("${task.deadline?.day.toString() ?? ""}/${task.deadline?.month.toString() ?? ""}/${task.deadline?.year.toString() ?? ""}")
            : "no deadline set",
        label: "Deadline",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Color(0xFFEE6F57),
          ),
        ),
        title: const Center(
            child: Text(
          "Task Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: BlocBuilder<TaskManagerBloc, TaskManagerState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: const Image(
                    image: AssetImage("assets/images/task_detail.png")),
              ),
              Column(
                children: tasks,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFEE6F57)),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}

class TaskField extends StatelessWidget {
  const TaskField({required this.title, required this.label});
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                color: const Color.fromARGB(255, 238, 238, 238),
                height: label == "Description" ? 150 : null,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: title,
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: label == "Description" ? 5 : 1,
                )),
          ],
        ),
      ),
    );
  }
}
