import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import "package:flutter_bloc/flutter_bloc.dart";
import 'features/task managment.dart/presentation/bloc/task_manager_bloc.dart';
import "./features/task managment.dart/presentation/pages/onboarding.dart";
import 'injection_conainer.dart' as di;

void main() async {
  await di.init();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(child: MyApp()),
    ),
  );
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
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
