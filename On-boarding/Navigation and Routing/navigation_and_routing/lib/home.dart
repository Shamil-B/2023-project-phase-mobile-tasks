import 'package:flutter/material.dart';
import 'package:navigation_and_routing/create_task.dart';
import "./task_detail.dart";

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tasks = [
      Task(title: "UI/UX App Design", date: "April 29,2023", color: "FF0000"),
      Task(title: "UI/UX App Design", date: "April 29,2023", color: "00FF00"),
      Task(title: "View Candidates", date: "April 29,2023", color: "FFFF00"),
      Task(
          title: "Football Cu Drybling",
          date: "April 29,2023",
          color: "FF0000"),
      Task(title: "View Candidates", date: "April 29,2023", color: "FFFF00"),
      Task(
          title: "Football Cu Drybling", date: "April 29,2023", color: "FF0000")
    ];

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFEE6F57),
        title: const Center(
            child: Text(
          "Todo List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 140, right: 140, top: 20, bottom: 20),
            child: const Image(image: AssetImage("assets/images/stickman.png")),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 50),
            child: const Text(
              "Tasks List",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              children: tasks,
            ),
          ),
          Container(
            // width: double.infinity,
            color: Colors.transparent,
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFEE6F57))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateTaskPage()));
              },
              child: const Text(
                "Create Task",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Task extends StatelessWidget {
  const Task({
    required this.title,
    required this.date,
    required this.color,
    super.key,
  });
  final String title;
  final String date;
  final String color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TaskDetail()));
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title[0],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            trailing: Container(
              width: 120,
              child: Row(
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 5,
                    height: 80,
                    color: Color(int.parse("0xFF" + color)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
