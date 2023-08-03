import 'package:flutter/material.dart';
import "./counter.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Counter',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const CircularCounter(),
    );
  }
}
