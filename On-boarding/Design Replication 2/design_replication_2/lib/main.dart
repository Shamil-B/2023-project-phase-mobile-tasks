import 'package:flutter/material.dart';
import "./add_task.dart";
import "./task_detail.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TaskDetail(),
    );
  }
}