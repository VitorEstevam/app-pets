import 'package:app_pets/classes/sub_task.dart';

abstract class Task {
  late String title;
  DateTime getNextDate();
  void markAsDone();
}

class TaskUnique implements Task {
  @override
  String title;
  late SubTask subTask;

  TaskUnique(this.title, DateTime _dateToDo){
    subTask = SubTask(_dateToDo);
  }
  
  @override
  DateTime getNextDate() {
    return subTask.dateToDo;
  }

  @override
  void markAsDone() {
    subTask.done = true;
  }
}