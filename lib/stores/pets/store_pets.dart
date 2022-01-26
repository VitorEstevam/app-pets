import 'dart:convert';

import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
// run builder on cmd to generate the code

part 'store_pets.g.dart';

class StorePets = _StorePets with _$StorePets;

// Create the class
abstract class _StorePets with Store {
  @observable
  late ObservableList<Pet> pets = ObservableList<Pet>.of([]);

  @observable
  Pet? actualPet;

  List<String> getPetNames() {
    List<String> names = pets.map((pet) => pet.name).toList();
    return names;
  }

  int getPetIndex(Pet pet) {
    return pets.indexOf(pet);
  }

  int getActualPetIndex() {
    return getPetIndex(actualPet!);
  }

  Future<bool> loadPets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var encoded = await prefs.getString("pets");
    if (encoded == null) return false;

    Map<String, dynamic> state = jsonDecode(encoded);
    List list = state["pets"].map((pet) => Pet.fromJson(pet)).toList();

    var _pets = ObservableList<Pet>.of([]);

    list.forEach((el) {
      _pets.add(el);
    });

    pets = _pets;
    actualPet = pets[0];
    return true;
  }

  @action
  void setActualPet(Pet newPet) {
    actualPet = newPet;
  }

  @action
  void setPets(ObservableList<Pet> _pets) {
    pets.addAll(_pets);
  }

  @action
  void addNewPet(Pet newPet) {
    pets.add(newPet);
    setActualPet(newPet);
  }

  @action
  void removePet(Pet _pet) {
    pets.remove(_pet);

    if (actualPet == _pet) {
      if (pets.length > 0) {
        actualPet = pets[0];
      } else {
        actualPet = null;
      }
    }
  }

  @action
  void removeTask(Task task) {
    task.pet.tasks.remove(task);
  }

  @action
  void addNewTaskToPet(Pet pet, Task task) {
    pet.tasks.add(task);
  }

  Pet getPetByName(petName) {
    return pets.firstWhere((pet) => pet.name == petName);
  }
}
