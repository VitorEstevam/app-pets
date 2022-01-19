
import 'package:app_pets/classes/tasks/task.dart';
import 'package:flutter/cupertino.dart';

class Pet {
  String name;
  String petIconUrl;
  Color colorReference;

  List<Task> tasks = [];

  Pet(this.name, this.petIconUrl, this.colorReference);
}