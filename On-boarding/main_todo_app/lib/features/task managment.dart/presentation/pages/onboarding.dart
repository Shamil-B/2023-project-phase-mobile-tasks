import 'package:flutter/material.dart';
import "./home.dart";

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 120, bottom: 50),
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
            child: const Image(
              image: AssetImage("assets/images/bg2.png"),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
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
