import 'package:app_pets/classes/task.dart';
import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'store_tasks.g.dart';
class StoreTasks = _StoreTasks with _$StoreTasks;

// Create the class
abstract class _StoreTasks with Store {
  @observable
  //ObservableList<Task> tasks = ObservableList<Task>.of([TaskUnique("Levar para tomar banho", DateTime(2022,01,09)), TaskUnique("Segunda dose do remédio de verme", DateTime(2022,01,05))]);
  ObservableList<Task> tasks = ObservableList<Task>.of([]);

  @action
  void insert(Task t) {
    tasks.insert(0,t);
  }
}