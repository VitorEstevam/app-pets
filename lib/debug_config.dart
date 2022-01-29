import 'dart:convert';

import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/pet.dart';

int petIndex = 0;
bool added = false;
void debugOptions(BuildContext context) {
  if (added) return;
  // added = true;

  var pet;
  var task;
  var json;
  var index;
  //---- luke
  index = Provider.of<StorePets>(context, listen: false).pets.indexWhere(
        (pet) => pet.name == "Luke",
      );
  if (index > -1) {
    Provider.of<StorePets>(context, listen: false).pets.removeAt(index);
  }

  json =
      "{\"name\":\"Luke\",\"petIconUrl\":\"lib\/assets\/pets\/DOG.png\",\"color\":\"Color(0xffff8a65)\",\"tasks\":[{\"title\":\"passear\",\"subTasks\":[{\"dateToDo\":\"2022-01-28 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.148738\",\"weekdays\":[3,5]},{\"title\":\"dar banho\",\"subTasks\":[{\"dateToDo\":\"2022-01-24 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-28 18:53:35.142753\"}]}";
  pet = Pet.fromJson(jsonDecode(json));
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);

  //---- zelda
  index = Provider.of<StorePets>(context, listen: false).pets.indexWhere(
        (pet) => pet.name == "Zelda",
      );
  if (index > -1) {
    Provider.of<StorePets>(context, listen: false).pets.removeAt(index);
  }
  json =
      "{\"name\":\"Zelda\",\"petIconUrl\":\"lib\/assets\/pets\/CAT.png\",\"color\":\"MaterialColor(primary value: Color(0xff2196f3))\",\"tasks\":[{\"title\":\"passear\",\"subTasks\":[{\"dateToDo\":\"2022-01-31 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-28 00:00:00.000\",\"done\":\"true\"},{\"dateToDo\":\"2022-01-25 00:00:00.000\",\"done\":\"true\"},{\"dateToDo\":\"2022-01-24 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-21 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-18 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-17 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-14 00:00:00.000\",\"done\":\"true\"},{\"dateToDo\":\"2022-01-11 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-10 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-07 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-04 00:00:00.000\",\"done\":\"false\"},{\"dateToDo\":\"2022-01-03 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-01 00:00:00.000\",\"weekdays\":[1,2,5]},{\"title\":\"dar banho\",\"subTasks\":[{\"dateToDo\":\"2022-02-01 00:00:00.000\",\"done\":\"false\"}],\"startDate\":\"2022-01-29 20:46:06.959041\"}]}";
  pet = Pet.fromJson(jsonDecode(json));
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);
  saveState(context);
}
