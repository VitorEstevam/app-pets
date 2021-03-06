import 'dart:collection';

import 'package:app_pets/classes/pet.dart';
import 'package:table_calendar/table_calendar.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

enum TaskStatus { late, today, coming, empty }

class SubTask {
  late DateTime dateToDo;
  bool done = false;

  SubTask(DateTime date) {
    dateToDo = DateTime(date.year, date.month, date.day);
  }

  //late DateTime dateToDo;
  // bool done = false;
  SubTask.fromJson(Map<String, dynamic> data) {
    dateToDo = DateTime.parse(data['dateToDo']);
    var val = data['done'];
    done = val.toLowerCase() == 'true';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dateToDo'] = dateToDo.toString();
    data['done'] = done.toString();

    return data;
  }

  TaskStatus getStatus() {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    var date = dateToDo;

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

  void markAsDone() {
    if (getStatus() == TaskStatus.today) {
      done = true;
    }
  }
}

class Task {
  late String title = "";
  late List<SubTask> subTasks = [];
  late Pet pet;
  late DateTime startDate = DateTime(0);

  Task(this.title, this.pet) {
    startDate = DateTime.now();
  }

  Task.empty();

  bool checkFutureDate(DateTime date) {
    return false;
  }

  String get subTitle {
    return "";
  }

  void markAsDone() {
    //pass
  }

  void updateSubTasks() {
    //pass
  }

  TaskStatus getStatus() {
    return TaskStatus.empty;
  }

  int get streak {
    return 0;
  }

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return data;
  }
}
