import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

class Pet {
  late String name;
  late String petIconUrl;
  late Color color;

  @observable
  ObservableList<Task> tasks = ObservableList<Task>.of([]);

  Pet(this.name, this.petIconUrl, this.color);

  Pet.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    petIconUrl = data['petIconUrl'];

    var colorCode = data['color'].split('(0x')[1].split(')')[0];
    int value = int.parse(colorCode, radix: 16);
    color = Color(value);

    // tasks = data['tasks'];

    if (data['tasks'] != null) {
      tasks = ObservableList<Task>.of([]);
      data['tasks'].forEach((t) {
        if (t.containsKey("weekdays")) {
          //task weekly
          var _task = TaskWeekly.fromJson(t);
          _task.pet = this;
          tasks.add(_task);
        } else {
          //task unique
          var _task = TaskUnique.fromJson(t);
          _task.pet = this;
          tasks.add(_task);
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['petIconUrl'] = petIconUrl;
    data['color'] = color.toString();
    data['tasks'] = tasks.map((t) => t.toJson()).toList();
    return data;
  }
}
