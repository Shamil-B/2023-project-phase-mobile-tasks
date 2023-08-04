import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tasks = [
      TaskField(title: "UI/UX App Design", label: "Title"),
      TaskField(
        title:
            "First I have to animate the logo and later prototyping my design. It's very important.",
        label: "Description",
      ),
      TaskField(
        title: "April 29, 2023 12:30 AM",
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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, size: 40),
            onPressed: () {},
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        leadingWidth: 80,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child:
                const Image(image: AssetImage("assets/images/task_detail.png")),
          ),
          const Column(
            children: tasks,
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              color: Color.fromARGB(255, 238, 238, 238),
              height: label == "Description" ? 150 : null,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
