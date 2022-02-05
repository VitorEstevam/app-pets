// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';
import 'dart:ui';

import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:test/test.dart';

void main() {
  // mock pet
  var mockpet = "{\"name\":\"Zelda\",\"petIconUrl\":\"lib\/assets\/pets\/CAT.png\",\"color\":\"Color(0xffe6ca19)\"}";
  var pet = Pet.fromJson(jsonDecode(mockpet));

  //table driven test
  group("Tasks return the right subtitle by their weekdays", () {
    var inputsToExpected = <List<int>, String>{
      [1]: "Segunda",
      [2, 3]: "Terça - Quarta",
      [4, 5, 6, 7]: "Quinta - Sexta - Sábado - Domingo",
      [1, 2, 3, 4, 5, 6, 7]: "Segunda - Terça - Quarta - Quinta - Sexta - Sábado - Domingo",
      [7, 3, 2, 5]: "Terça - Quarta - Sexta - Domingo",
    };

    inputsToExpected.forEach((input, expected) {
      test("$input -> $expected", () {
        var task = TaskWeekly("task", pet, input);
        var subTitle = task.subTitle;
        expect(subTitle, expected);
      });
    });
  });

  group("TaskWeekly get streak", () {
    // get fridays
    var now = DateTime.now();

    var begin = DateTime(2022, 01, 01);
    var end = DateTime(now.year, now.month, now.day);
    var date = begin;

    List<DateTime> fridays = [];

    while (!date.isAfter(end)) {
      if (date.weekday == DateTime.friday) {
        fridays.add(date);
      }
      date = date.add(const Duration(days: 1));
    }

    // mock pet
    var mockpet = "{\"name\":\"Zelda\",\"petIconUrl\":\"lib\/assets\/pets\/CAT.png\",\"color\":\"Color(0xffe6ca19)\"}";
    var pet = Pet.fromJson(jsonDecode(mockpet));

    //task
    var task = TaskWeekly("task", pet, [5]);
    task.startDate = begin;
    pet.tasks.add(task);

    setUp() {
      // set all the subtasks to undone
      task.subTasks = [];
      task.updateSubTasks();
    }

    test("Check the streak if all the subtasks are done", () {
      setUp();

      int expectedStreak = fridays.length;

      // set all the subtasks done
      task.subTasks.forEach((task) {
        task.done = true;
      });
      pet.tasks[0] = task;
      int streak = pet.tasks[0].streak;

      expect(streak, equals(expectedStreak));
    });

    test("Check the streak if only the most recent subtask is done", () {
      setUp();

      int expectedStreak = 1;

      // set only the last the subtasks done
      task.subTasks[0].done = true;
      pet.tasks[0] = task;
      int streak = pet.tasks[0].streak;

      expect(streak, equals(expectedStreak));
    });
  });
}
