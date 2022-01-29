import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/pet.dart';

int petIndex = 0;

void debugOptions(BuildContext context) {
  var pet;
  var task;

  //---- luke
  pet = Pet("Luke $petIndex", "lib/assets/pets/DOG.png", Colors.green);
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);

  task = TaskUnique("dar banho", pet, DateTime(2022, 01, 24));
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet, task);

  task = TaskWeekly("passear", pet, [3, 5]);
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet, task);

  //---- zelda
  pet = Pet("Zelda $petIndex", "lib/assets/pets/CAT.png", Colors.blue);
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);

  task = TaskUnique("dar banho", pet, DateTime(2022, 02, 01));
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet, task);

  var t2 = TaskWeekly("passear", pet, [1, 2, 5]);
  t2.subTasks = [];
  t2.startDate = DateTime(2022, 01, 01);
  t2.updateSubTasks();
  t2.subTasks[7].done = true;
  t2.subTasks[2].done = true;
  t2.subTasks[1].done = true;
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet, t2);

  petIndex += 1;

  saveState(context);
}
