import 'package:flutter/material.dart';
import "./constants.dart";

class CircularCounter extends StatefulWidget {
  const CircularCounter({super.key});

  @override
  State<CircularCounter> createState() => _CircularCounterState();
}

class _CircularCounterState extends State<CircularCounter> {
  int count = 0;

  void increament() {
    setState(() {
      count++;
    });
    if (count > 10) {
      count = 0;
    }
  }

  void decreament() {
    setState(() {
      count--;
    });
    if (count < 0) {
      count = 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Circular Counter",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        )),
        backgroundColor: const Color.fromARGB(255, 22, 100, 126),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$count",
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    increament();
                  },
                  child: const Text(
                    "Increment",
                    style: KButtonStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    decreament();
                  },
                  child: const Text(
                    "Decrement",
                    style: KButtonStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
