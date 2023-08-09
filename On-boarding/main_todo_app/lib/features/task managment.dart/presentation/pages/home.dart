import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_todo_app/features/task%20managment.dart/domain/entities/task.dart';
import 'package:main_todo_app/features/task%20managment.dart/presentation/bloc/task_manager_bloc.dart';
import "./task_detail.dart" as task_detail;
import 'create_task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tasks = [];
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFEE6F57),
        title: const Center(
            child: Text(
          "Todo List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )),
      ),
      body: BlocBuilder<TaskManagerBloc, TaskManagerState>(
        builder: (context, state) {
          print(state);
          if (state is LoadedTasks) {
            tasks = state.tasks
                .map((task) => Task(
                      task: task,
                    ))
                .toList();
          } else {
            BlocProvider.of<TaskManagerBloc>(context).add(TasksRequested());
          }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 140, right: 140, top: 20, bottom: 20),
                child: const Image(
                    image: AssetImage("assets/images/stickman.png")),
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
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFEE6F57))),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTaskPage()))
                        .then((task) {
                      BlocProvider.of<TaskManagerBloc>(context)
                          .add(TaskAdded(task: task));

                      setState(() {
                        tasks = tasks;
                      });
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
        },
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({
    required this.task,
    super.key,
  });

  final ToDoTask task;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    task_detail.TaskDetail(task: widget.task)));
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
              child: Checkbox(
                checkColor: Colors.white,
                value: widget.task.isDone,
                onChanged: (bool? value) {
                  BlocProvider.of<TaskManagerBloc>(context)
                      .add(TaskMarked(task: widget.task));
                  setState(() {});
                },
              ),
            ),
            title: Text(
              widget.task.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            trailing: Container(
              width: 100,
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "${widget.task.deadline!.day} - ${widget.task.deadline!.month} - ${widget.task.deadline!.year}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
