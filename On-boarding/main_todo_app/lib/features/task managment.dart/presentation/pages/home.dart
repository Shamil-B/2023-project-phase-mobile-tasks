import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_todo_app/features/task%20managment.dart/presentation/bloc/task_manager_bloc.dart';
import '../widgets/task_tile.dart';
import 'create_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tasks = [];
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFFEE6F57),
        title: const Center(
            child: Text(
          "Todo List",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
        )),
      ),
      body: BlocBuilder<TaskManagerBloc, TaskManagerState>(
        builder: (context, state) {
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
                  children: (tasks.isEmpty)
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
                      : tasks,
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
