import 'package:app_pets/classes/task.dart';
import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'store_tasks.g.dart';
class StoreTasks = _StoreTasks with _$StoreTasks;

// Create the class
abstract class _StoreTasks with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>.of([TaskUnique("Levar para tomar banho", DateTime.now()), TaskUnique("Segunda dose do remédio de verme", DateTime.now())]);

  @action
  void insert(Task t) {
    tasks.add(t);
  }
}