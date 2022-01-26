import 'package:intl/intl.dart';

import 'task.dart';

class TaskUnique extends Task {
  TaskUnique(title, pet, DateTime date) : super(title, pet) {
    var _task = SubTask(date);
    subTasks.add(_task);
  }

  // late String title = "";
  // late List<SubTask> subTasks = [];
  // late Pet pet;
  // late DateTime startDate = DateTime(0);
  TaskUnique.fromJson(Map<String, dynamic> data) : super.empty() {
    title = data['title'];
    startDate = DateTime.parse(data['startDate']);

    if (data['subTasks'] != null) {
      subTasks = [];
      data['subTasks'].forEach((st) {
        subTasks.add(SubTask.fromJson(st));
      });
    }
  }

  // String title = "";
  // List<SubTask> subTasks = [];
  // Pet pet;
  // DateTime startDate = DateTime(0);
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['subTasks'] = subTasks.map((t) => t.toJson()).toList();
    // pet should be created on fromJson constructor
    data['startDate'] = startDate.toString();
    return data;
  }

  @override
  String get subTitle {
    return DateFormat('dd/MM/yyyy').format(subTasks[0].dateToDo);
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
