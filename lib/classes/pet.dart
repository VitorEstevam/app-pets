import 'package:app_pets/classes/tasks/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

class Pet {
  String name;
  String petIconUrl;
  Color color;

  @observable
  ObservableList<Task> tasks = ObservableList<Task>.of([]);

  Pet(this.name, this.petIconUrl, this.color);
}
