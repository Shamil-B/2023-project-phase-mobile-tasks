import 'package:flutter/material.dart';
import 'create_task.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 120, bottom: 50),
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 100),
            child: const Image(
              image: AssetImage("assets/images/bg1.png"),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xFF0C8CE9))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateTaskPage()));
            },
            child: const Text(
              "Get Started",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]),
      ),
    );
  }
}
