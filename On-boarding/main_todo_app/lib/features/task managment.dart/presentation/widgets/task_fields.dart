import 'package:flutter/material.dart';

class TaskField extends StatelessWidget {
  const TaskField({required this.title, required this.label});
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                color: const Color.fromARGB(255, 238, 238, 238),
                height: label == "Description" ? 150 : null,
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: title,
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: label == "Description" ? 5 : 1,
                )),
          ],
        ),
      ),
    );
  }
}
