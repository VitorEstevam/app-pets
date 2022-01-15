import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
// run builder on cmd to generate the code

part 'store_global.g.dart';

class StoreGlobal = _StoreGlobal with _$StoreGlobal;

// Create the class
abstract class _StoreGlobal with Store {
  bool tutorialDone = true;

  @observable
  ObservableList<Pet> pets = ObservableList<Pet>.of([
    Pet(
      "Luke",
      "lib/assets/dog_icon_creation.png",
      "lib/assets/purple_icon.png",
      Colors.purple,
    )
  ]);

  @observable
  Map<String, Pet> mapPets = {};

  //ObservableList<Pet> pets = ObservableList<Pet>.of([ Pet("Zelda", "lib/assets/dog1.jpeg", Colors.purple)]);

  List<String> getPetNames() {
    List<String> names = [];
    for (var i = 0; i < pets.length; i++) {
      names.add(pets[i].name);
    }
    return names;
  }

  Pet getPetByIndex(int index) {
    if (index < pets.length) {
      return pets[index];
    } else {
      return pets[0];
    }
  }

  Widget starting_app_route() {
    if (!tutorialDone)
      return OnboardingIntro();
    else if (pets.isEmpty)
      return CreatePetIntro(); // @TODO CRIAÇÃO DE PETS
    else
      return TabBarHandler();
  }

  @action
  void addNewPet(Pet newPet) {
    mapPets[newPet.name] = newPet;
    pets.add(newPet);
  }

  @action
  void addNewTaskToPet(String petName, Task task) {
    Pet pet = mapPets[petName]!;
    pet.tasks.add(task);
  }
}
