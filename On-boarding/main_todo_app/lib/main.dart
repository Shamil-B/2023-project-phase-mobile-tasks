import 'package:flutter/material.dart';
import 'features/task managment.dart/presentation/pages/home.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'features/task managment.dart/presentation/bloc/task_manager_bloc.dart';

void main() {
  runApp(const MyApp());
}

// in order to provide the bloc to the widget tree, we need to wrap the widget tree with BlocProvider

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider is a widget that provides a bloc to its children via BlocProvider.of(context)
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskManagerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AddTaskPage(),
      ),
    );
  }
}
