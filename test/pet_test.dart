import 'dart:convert';

import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  test('pet can be converted to json', () {
    var pet = Pet("Luke", "lib/assets/pets/DOG.png", Color(0xffFF8A65));
    var task = TaskUnique("dar banho", pet, DateTime(2022, 01, 24));
    pet.tasks.insert(0, task);
    var task2 = TaskWeekly("passear", pet, [3, 5]);
    pet.tasks.insert(0, task2);

    var json = jsonEncode(pet.toJson());
    print(json);

    var petDecoded = Pet.fromJson(jsonDecode(json));
    print(petDecoded);

    var jsonDecoded = jsonEncode(petDecoded.toJson());
    print(jsonDecoded);
  });
}
