import 'package:flutter/material.dart';

class TaskField extends StatelessWidget {
  const TaskField(
      {required this.title,
      required this.label,
      required this.controller,
      super.key});
  final String title;
  final TextEditingController controller;
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
                child: label == "Deadline"
                    ? Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: title,
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                ).then((value) => controller.text =
                                    value.toString().substring(0, 10));
                              },
                              icon: const Icon(Icons.calendar_today)),
                        ],
                      )
                    : TextField(
                        controller: controller,
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
