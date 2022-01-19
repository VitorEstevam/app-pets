
import 'package:intl/intl.dart';

import 'task.dart';

class TaskUnique extends Task {
  TaskUnique(title, pet, DateTime date) : super(title, pet) {
    var _task = SubTask(date);
    subTasks.add(_task);
  }

  @override
  String get subTitle {
    return  DateFormat('dd/MM/yyyy').format(subTasks[0].dateToDo);
  }

  @override
  void markAsDone() {
      subTasks[0].markAsDone();
  }

  @override
  TaskStatus getStatus() {
    return subTasks[0].getStatus();
  }
}