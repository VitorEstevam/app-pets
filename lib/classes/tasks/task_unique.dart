
import 'task.dart';

class TaskUnique extends Task {
  TaskUnique(title, DateTime date) : super(title) {
    var _task = SubTask(date);
    subTasks.add(_task);
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