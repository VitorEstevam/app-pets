import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
// run builder on cmd to generate the code

part 'store_pets.g.dart';

class StorePets = _StorePets with _$StorePets;

// Create the class
abstract class _StorePets with Store {
  @observable
  ObservableList<Pet> pets = ObservableList<Pet>.of([]);

  List<String> getPetNames() {
    List<String> names = pets.map((pet) => pet.name).toList();
    return names;
  }

  @action
  void addNewPet(Pet newPet) {
    pets.add(newPet);
  }

  @action
  void addNewTaskToPet(Pet pet, Task task) {
    pet.tasks.add(task);
  }

  Pet getPetByName(petName){
    return pets.firstWhere((pet) => pet.name == petName);
  }
}
