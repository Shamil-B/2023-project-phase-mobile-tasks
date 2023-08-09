import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../bloc/task_manager_bloc.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        title: const Center(child: Text("")),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50, top: 30, bottom: 20),
            child: const Text(
              "Create new task",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: [
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                surfaceTintColor: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("title",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEE6F57))),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: "title",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                surfaceTintColor: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("deadline",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEE6F57))),
                        TextField(
                          controller: deadlineController,
                          decoration: InputDecoration(
                            hintText: "deadline of the task...",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                surfaceTintColor: Colors.white,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  color: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("description",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEE6F57))),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: "descripion of the task",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFEE6F57))),
              onPressed: () {
                ToDoTask task = ToDoTask(
                    id: 0,
                    title: titleController.text,
                    description: descriptionController.text,
                    deadline: DateTime.now());
                Navigator.pop(context, task);
              },
              child: const Text(
                "Add Task",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
