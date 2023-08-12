import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_manager_bloc.dart';
import "../pages/task_detail.dart" as task_detail;
import '../../domain/entities/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    required this.task,
    super.key,
  });

  final ToDoTask task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
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
            leading: Checkbox(
              checkColor: Colors.white,
              value: widget.task.isDone,
              onChanged: (bool? value) {
                BlocProvider.of<TaskManagerBloc>(context)
                    .add(TaskMarked(task: widget.task));
                setState(() {
                  widget.task.isDone = value!;
                });
              },
            ),
            title: Text(
              widget.task.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: (widget.task.isDone)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "${widget.task.deadline!.day} - ${widget.task.deadline!.month} - ${widget.task.deadline!.year}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
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
