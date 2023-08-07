import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';
import "package:todo_app/presentation/screens/home_screen.dart";
import "package:todo_app/presentation/screens/onboarding.dart";
import "package:todo_app/presentation/widgets/custom_dialog_newtodo.dart";

void main() {
  // Testing the task creation
  testWidgets('Create a task', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our OnboardingPage is rendered.
    expect(find.byType(OnboardingPage), findsOneWidget);

    // Tap the 'Get Started' button.
    await tester.tap(find.text('Get Started'));
    await tester.pump();

    // Verify that our HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);

    // Tap the 'Add Task' button.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our CustomdialogNewTodo (task adder widget) is rendered.
    expect(find.byType(CustomdialogNewTodo), findsOneWidget);

    // Enter 'Test Task' into the TextField.
    await tester.enterText(find.byType(TextField), 'Test Task');
    await tester.pump();

    // Tap the 'Add' button.
    await tester.tap(find.text('Create'));
    await tester.pump();

    // Verify that our task is rendered.
    expect(find.text('Test Task'), findsOneWidget);
  });

  // Testing task listing
  testWidgets('List tasks', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our OnboardingPage is rendered.
    expect(find.byType(OnboardingPage), findsOneWidget);

    // Tap the 'Get Started' button.
    await tester.tap(find.text('Get Started'));
    await tester.pump();

    // Verify that our HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);

    // Tap the 'Create Task' button.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our CustomdialogNewTodo (task adder widget) is rendered.
    expect(find.byType(CustomdialogNewTodo), findsOneWidget);

    // Enter 'Test Task' into the TextField.
    await tester.enterText(find.byType(TextField), 'Test Task');
    await tester.pump();

    // Tap the 'Create' button.
    await tester.tap(find.text('Create'));
    await tester.pump();

    // Verify that our task is rendered.
    expect(find.text('Test Task'), findsOneWidget);
  });

  testWidgets('Navigate from onboarding.', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our OnboardingPage is rendered.
    expect(find.byType(OnboardingPage), findsOneWidget);

    // Tap the 'Get Started' button.
    await tester.tap(find.text('Get Started'));
    await tester.pump();

    // Verify that our HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
