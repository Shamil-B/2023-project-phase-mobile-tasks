import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:main_todo_app/features/task%20managment/data/models/task_model.dart';
import 'package:main_todo_app/features/task%20managment/domain/entities/task.dart';
import "package:main_todo_app/fixture_reader.dart";

void main() {
  final taskModel = TaskModel(
      id: 1,
      title: "title",
      description: "description",
      isDone: false,
      deadline: null);
  test('should be a subclass of ToDoTask entity', () {
    // assert
    expect(taskModel, isA<ToDoTask>());
  });

  group('Json', () {
    test(
      'fromJson should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('task.json'));
        // act
        final result = TaskModel.fromJson(jsonMap);
        // assert
        expect(result, taskModel);
      },
    );

    test("toJson should return a valid json map", () {
      // act
      final result = taskModel.toJson();
      // assert
      final expectedMap = {
        "id": 1,
        "title": "title",
        "description": "description",
        "deadline": null,
        "isDone": false
      };
      expect(result, expectedMap);
    });
  });
}
