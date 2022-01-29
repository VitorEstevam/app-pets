// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';

import 'package:app_pets/classes/pet.dart';
import 'package:test/test.dart';

void main() {
  group('Pet from/to json', () {
    test('pet can be created from json and converted back', () {
      var jsonBefore =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\",\"tasks\":[{\"title\":\"passear\",\"subTasks\":[{\"dateToDo\":\"2022-01-28 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.148738\",\"weekdays\":[3,5]},{\"title\":\"dar banho\",\"subTasks\":[{\"dateToDo\":\"2022-01-24 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.142753\"}]}";

      var pet = Pet.fromJson(jsonDecode(jsonBefore));
      var jsonAfter = jsonEncode(pet.toJson());

      expect(jsonAfter, equals(jsonBefore));
    });

    test('pet can be created from json and converted back with changes', () {
      var jsonExpected =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\",\"tasks\":[]}";
      var jsonBefore =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\",\"tasks\":[{\"title\":\"passear\",\"subTasks\":[{\"dateToDo\":\"2022-01-28 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.148738\",\"weekdays\":[3,5]},{\"title\":\"dar banho\",\"subTasks\":[{\"dateToDo\":\"2022-01-24 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.142753\"}]}";

      var pet = Pet.fromJson(jsonDecode(jsonBefore));
      pet.tasks.clear();
      var jsonAfter = jsonEncode(pet.toJson());

      expect(jsonAfter, equals(jsonExpected));
    });

    test('pet can be created from json and converted back without task value',
        () {
      var jsonExpected =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\",\"tasks\":[]}";
      var jsonBefore =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\"}";

      var pet = Pet.fromJson(jsonDecode(jsonBefore));
      pet.tasks.clear();
      var jsonAfter = jsonEncode(pet.toJson());

      expect(jsonAfter, equals(jsonExpected));
    });

    test('pet can\'t be created from json with missing fields', () {
      var jsonBefore =
          "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"tasks\":[{\"title\":\"passear\",\"subTasks\":[{\"dateToDo\":\"2022-01-28 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.148738\",\"weekdays\":[3,5]},{\"title\":\"dar banho\",\"subTasks\":[{\"dateToDo\":\"2022-01-24 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.142753\"}]}";

      expect(() => Pet.fromJson(jsonDecode(jsonBefore)),
          throwsA(isA<Exception>()));
    });
  });
}
