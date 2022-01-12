
import 'package:app_pets/classes/task.dart';
import 'package:flutter/cupertino.dart';

class Pet {
  String name;
  String petIconUrl;
  String colorIconUrl;
  Color colorReference;

  List<Task> tasks = [];

  Pet(this.name, this.petIconUrl, this.colorIconUrl, this.colorReference);
}