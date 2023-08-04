import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tasks = [
      TaskField(title: "Task name", label: "Main task name"),
      TaskField(
          title: "Deadline eg: April 29, 2023 12:30 AM",
          label: "Due date",
          isDate: true),
      TaskField(
        title: "Here goes your description",
        label: "Description",
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
          const Column(
            children: tasks,
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFEE6F57))),
              onPressed: () {},
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

class TaskField extends StatelessWidget {
  const TaskField(
      {required this.title, this.isDate = false, required this.label});
  final String title;
  final bool isDate;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFEE6F57))),
              TextField(
                decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              )
            ],
          ),
          trailing: isDate
              ? const Icon(
                  Icons.calendar_today,
                  color: Color(0xFFEE6F57),
                )
              : null,
        ),
      ),
    );
  }
}
