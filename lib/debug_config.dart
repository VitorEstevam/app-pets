import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/pet.dart';

void debugOptions(BuildContext context) {
  var pet = Pet("Luke", "lib/assets/pets/DOG.png", Colors.green);
  Provider.of<StorePets>(context, listen: false).addNewPet(pet);
  var task = TaskUnique("dar banho", pet, DateTime(2022, 01, 23));
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet, task);

  var pet2 = Pet("Zelda", "lib/assets/pets/CAT.png", Colors.blue);
  Provider.of<StorePets>(context, listen: false).addNewPet(pet2);
  var task2 = TaskUnique("dar banho", pet, DateTime(2022, 01, 23));
  var task3 = TaskUnique("dar banho", pet, DateTime(2022, 01, 23));
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet2, task2);
  Provider.of<StorePets>(context, listen: false).addNewTaskToPet(pet2, task3);
}
