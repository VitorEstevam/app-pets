import 'package:app_pets/classes/pet.dart';
import 'package:mobx/mobx.dart';
// run builder on cmd to generate the code

part 'store_global.g.dart';
class StoreGlobal = _StoreGlobal with _$StoreGlobal;

// Create the class
abstract class _StoreGlobal with Store {
  @observable
  bool tutorialDone = false;

  @observable
  ObservableList<Pet> pets = ObservableList<Pet>.of([]);
}