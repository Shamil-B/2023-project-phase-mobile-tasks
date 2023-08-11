import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_todo_app/features/task%20managment.dart/presentation/bloc/task_manager_bloc.dart';
import '../widgets/task_tile.dart';
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
                .map((task) => TaskTile(
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
