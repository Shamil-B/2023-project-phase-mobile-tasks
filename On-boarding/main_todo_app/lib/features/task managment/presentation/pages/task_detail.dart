import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';

import '../bloc/task_manager_bloc.dart';
import '../widgets/task_fields.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({required this.task, super.key});
  final ToDoTask task;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    final deadlineController = TextEditingController(
        text: (task.deadline != null)
            ? ("${task.deadline?.year.toString() ?? ""}-${task.deadline?.month.toString() ?? ""}-${task.deadline?.day.toString() ?? ""}")
            : "no deadline set");

    List<Widget> tasks = [
      TaskField(title: task.title, label: "Title", controller: titleController),
      TaskField(
        title:
            task.description == null ? "no description set" : task.description!,
        label: "Description",
        controller: descriptionController,
      ),
      TaskField(
        title: (task.deadline != null)
            ? ("${task.deadline?.day.toString() ?? ""}-${task.deadline?.month.toString() ?? ""}-${task.deadline?.year.toString() ?? ""}")
            : "no deadline set",
        label: "Deadline",
        controller: deadlineController,
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
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        title: const Text(
          "Task Detail",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
        ),
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
                    onPressed: () {
                      BlocProvider.of<TaskManagerBloc>(context).add(TaskUpdated(
                        id: task.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        deadline: DateTime.parse(deadlineController.text),
                      ));
                      Navigator.pop(context);
                    },
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
