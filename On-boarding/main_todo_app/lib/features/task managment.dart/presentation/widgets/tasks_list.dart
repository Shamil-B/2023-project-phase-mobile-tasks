import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_manager_bloc.dart';
import '../pages/create_task.dart';

class TasksLists extends StatefulWidget {
  final List<Widget> tasks;
  const TasksLists({super.key, required this.tasks});

  @override
  State<TasksLists> createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 30, bottom: 20),
          padding: const EdgeInsets.only(left: 50),
          child: const Text(
            "Tasks List",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: ListView(
            children: (widget.tasks.isEmpty)
                ? [
                    Container(
                      margin: const EdgeInsets.only(top: 200),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.not_interested_outlined,
                              size: 35, color: Colors.black),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "No tasks yet",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
                : widget.tasks,
          ),
        ),
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: ElevatedButton(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                backgroundColor: MaterialStatePropertyAll(Color(0xFFEE6F57))),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateTaskPage()))
                  .then((task) {
                BlocProvider.of<TaskManagerBloc>(context)
                    .add(TaskAdded(task: task));
              });
            },
            child: const Text(
              "Create Task",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
