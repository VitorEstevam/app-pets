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

  Pet pet;
  var task;
  var json;
  int index;

  //---- luke
  index = Provider.of<StorePets>(context, listen: false).pets.indexWhere(
        (pet) => pet.name == "Luke",
      );
  if (index > -1) {
    Provider.of<StorePets>(context, listen: false).pets.removeAt(index);
  }

  json =
      "{\"name\": \"Luke\",\"petIconUrl\": \"lib\/assets\/pets\/DOG3.png\",\"color\": \"Color(0xffff8a65)\",\"tasks\": [{\"title\": \"passear\",\"subTasks\": [{\"dateToDo\": \"2022-02-01 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-31 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-30 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-29 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-28 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-27 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-26 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-25 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-24 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-23 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-22 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-21 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-20 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-19 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-18 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-17 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-16 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-15 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-14 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-13 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-12 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-11 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-10 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-09 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-08 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-07 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-06 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-05 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-04 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-03 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-02 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-01 00:00:00.000\",\"done\": \"true\"}],\"startDate\": \"2022-01-01 18:53:35.148738\",\"weekdays\": [1,2,3,4,5,6,7]},{\"title\": \"Retorno veterin\u00e1rio\",\"subTasks\": [{\"dateToDo\": \"2022-01-24 00:00:00.000\",\"done\": \"false\"}],\"startDate\": \"2022-01-01 18:53:35.142753\"}]}";
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
      "{\"name\": \"Zelda\",\"petIconUrl\": \"lib\/assets\/pets\/CAT.png\",\"color\": \"Color(0xff2196f3)\",\"tasks\": [{\"title\": \"Ir na pracinha\",\"subTasks\": [{\"dateToDo\": \"2022-02-04 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-02-01 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-31 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-28 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-25 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-24 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-21 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-18 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-17 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-14 00:00:00.000\",\"done\": \"true\"},{\"dateToDo\": \"2022-01-11 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-10 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-07 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-04 00:00:00.000\",\"done\": \"false\"},{\"dateToDo\": \"2022-01-03 00:00:00.000\",\"done\": \"false\"}],\"startDate\": \"2022-01-01 00:00:00.000\",\"weekdays\": [1,2,5]},{\"title\": \"Rem\u00e9dio\",\"subTasks\": [{\"dateToDo\": \"2022-02-02 00:00:00.000\",\"done\": \"false\"}],\"startDate\": \"2022-01-29 20:46:06.959041\"}]}";
  pet = Pet.fromJson(jsonDecode(json));
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);

  saveState(context);
}
