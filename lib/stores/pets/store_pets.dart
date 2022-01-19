import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'store_pets.g.dart';

// Create the class
class StorePets = _StorePets with _$StorePets;

abstract class _StorePets with Store {
  @observable
  ObservableList<Pet> pets = ObservableList<Pet>.of([]);

  @observable
  Pet? actualPet;

  @action
  void setPet(Pet _pet) {
    actualPet = _pet;
  }

  @action
  void addPet(Pet _pet) {
    pets.add(_pet);
  }

  @action
  void addTask(Pet _pet, Task _task) {
    for (var p in pets) {
      if (p == _pet) p.tasks.insert(0, _task);
    }
  }

  // @action
  // void addNewPet(Pet newPet) {
  //   mapPets[newPet.name] = newPet;
  //   pets.add(newPet);
  // }

  // @action
  // void addNewTaskToPet(String petName, Task task) {
  //   Pet pet = mapPets[petName]!;
  //   pet.tasks.add(task);
  // }
  // @observable
  // Pet? actualPet;

  // @action
  // void setPet(Pet _pet){
  //   actualPet = _pet;
  // }
}
