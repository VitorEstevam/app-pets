import 'package:app_pets/consts/utils.dart';

import 'task.dart';

class TaskWeekly extends Task {
  List<int> weekdays;

  TaskWeekly(title, pet, this.weekdays) : super(title, pet) {
    updateSubTasks();
  }

  @override
  String get subTitle {
    var content = "";

    for (var day in weekdays) {
      if (content != "") content += " - ";

      switch (day) {
        case DateTime.monday:
          content += "Segunda";
          break;
        case DateTime.tuesday:
          content += "Terça";
          break;
        case DateTime.wednesday:
          content += "Quarta";
          break;
        case DateTime.thursday:
          content += "Quinta";
          break;
        case DateTime.friday:
          content += "Sexta";
          break;
        case DateTime.saturday:
          content += "Sábado";
          break;
        case DateTime.sunday:
          content += "Domingo";
          break;
        default:
          content += "";
          break;
      }
    }

    return content;
  }

  @override
  bool checkFutureDate(DateTime date) {
    if (compareDates(date, DateTime.now()) < 0) return false;
    return weekdays.contains(date.weekday);
  }

  @override
  int get streak {
    var streak = 0;
    for (var task in subTasks) {
      if (!task.done) {
        streak = 0;
      } else {
        streak++;
      }
    }
    return streak;
  }

  @override
  void updateSubTasks() {
    var days = subTasks.map((e) => e.dateToDo).toList();
    var start = startDate;
    var end = DateTime.now();
    final daysToGenerate = end.difference(start).inDays;

    for (var i = 0; i < daysToGenerate; i++) {
      var day = DateTime(start.year, start.month, start.day + (i));

      if (!days.contains(day)) {
        if (weekdays.contains(day.weekday)) {
          var subTask = SubTask(day);

          if (!subTasks.contains(subTask)) {
            subTasks.insert(0, subTask);
          }
        }
      }
    }

    // get next events
    for (var i = 0; i < 7; i++) {
      var day = DateTime(end.year, end.month, end.day + (i));

      if (weekdays.contains(day.weekday)) {
        var subTask = SubTask(day);

        SubTask? t;
        for (var i in subTasks) {
          if (i.dateToDo == subTask.dateToDo) {
            t = i;
            break;
          }
        }
        if (t == null) {
          subTasks.insert(0, subTask);
          return;
        }
        if (t.done == false) {
          return;
        }
      }
    }
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
