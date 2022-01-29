// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';

import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:test/test.dart';

void main() {
  // mock pet
  var mockpet = "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffe6ca19)\"}";
  var pet = Pet.fromJson(jsonDecode(mockpet));

  var store = StorePets();
  store.addNewPet(pet);

  group('Add task to pet by store', () {
    test('Add taskUnique to pet', () {
      var task = TaskUnique("Remédio", pet, DateTime(2021, 02, 15));
      store.addNewTaskToPet(pet, task);

      expect(task, store.getPetByName(pet.name).tasks[0]);
    });
    test('Add taskWeekly to pet', () {
      var task = TaskWeekly("Brincar", pet, [1,3,5]);
      store.addNewTaskToPet(pet, task);

      expect(task, store.getPetByName(pet.name).tasks[0]);
    });
  });
}
