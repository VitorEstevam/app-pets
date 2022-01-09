import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

//------------
class SubTask {
  DateTime dateToDo;
  bool done = false;

  SubTask(this.dateToDo);
}

//-------------------------------------
enum TaskStatus { late, today, coming }

class Task {
  String title = "";
  List<SubTask> subTasks = [];

  Task(this.title);

  void markAsDone() {
    //pass
  }
  void updateSubTasks() {
    //pass
  }
  TaskStatus getStatus() {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    var date = subTasks[0].dateToDo;

    var c = date.compareTo(today);
    switch (c) {
      case -1:
        return TaskStatus.late;
      case 0:
        return TaskStatus.today;
      case 1:
        return TaskStatus.coming;
      default:
        return TaskStatus.late;
    }
  }

  //get status -> enum late, onDay and coming

  LinkedHashMap<DateTime, List<bool>> toMap() {
    var map = LinkedHashMap<DateTime, List<bool>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (var subTask in subTasks) {
      map[subTask.dateToDo] = [subTask.done];
    }
    return map;
  }
}

class TaskMultiday extends Task {
  DateTime startDate = DateTime(0);

  TaskMultiday(title) : super(title) {
    startDate = DateTime.now();
  }

  int getStreak() {
    return 0;
  }
}

class TaskUnique extends Task {
  TaskUnique(title, DateTime date) : super(title) {
    var _task = SubTask(date);
    subTasks.add(_task);
  }

  @override
  void markAsDone() {
    var _now = DateTime.now().toUtc();
    if (getStatus() == TaskStatus.today) {
      subTasks[0].done = true;
    }
  }

  @override
  void updateSubTasks() {
    //pass
  }
}

class TaskWeekly extends TaskMultiday {
  List<int> weekdays;

  TaskWeekly(title, this.weekdays) : super(title);

  @override
  int getStreak() {
    //todo
    return 0;
  }

  @override
  void updateSubTasks() {
    //todo
  }
  @override
  void markAsDone() {
    //todo
  }
}

class TaskPeriodic extends TaskMultiday {
  Duration period;
  TaskPeriodic(title, this.period) : super(title);

  @override
  int getStreak() {
    //todo
    return 0;
  }

  @override
  void updateSubTasks() {
    //todo
  }
  @override
  void markAsDone() {
    //todo
  }
}

//-------------------------
// void main() {
// //   var tu1 = TaskUnique("task unique 1", DateTime(2022, 01, 02));
// //   tu1.markAsDone();
// //   print(tu1.title +
// //       tu1.subTasks[0].dateToDo.toString() +
// //       tu1.subTasks[0].done.toString());

// //   var tu2 = TaskUnique("aaaaa", DateTime.now().add(Duration(days: 1)));
// //   tu2.markAsDone();
// //   print(tu2.title +
// //       tu2.subTasks[0].dateToDo.toString() +
// //       tu2.subTasks[0].done.toString());

//   var tu = TaskUnique("t1", DateTime(2019));
//   var tw = TaskWeekly("t1", [DateTime.monday, DateTime.tuesday]);
//   var tp = TaskPeriodic("t1", Duration(days: 2));

//   print(tu is Task);
//   print(tw is Task);
//   print(tp is Task);
// }
