import 'dart:convert';

import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int compareDates(DateTime d1, d2) {
  var _d1 = DateTime(d1.year, d1.month, d1.day);
  var _d2 = DateTime(d2.year, d2.month, d2.day);

  return _d1.compareTo(_d2);
}

bool isToday(DateTime date) {
  return compareDates(date, DateTime.now()) == 0;
}

void saveState(context) async {
  var pets = Provider.of<StorePets>(context, listen: false).pets;
  var list = pets.map((pet) => pet.toJson()).toList();
  Map<String, dynamic> state = {"pets": list};
  var encoded = jsonEncode(state);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("pets", encoded);
}

Future<bool> loadState(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var encoded = await prefs.getString("pets");

  Map<String, dynamic> state = jsonDecode(encoded!);
  List list = state["pets"].map((pet) => Pet.fromJson(pet)).toList();

  var pets = ObservableList<Pet>.of([]);

  list.forEach((el) {
    pets.add(el);
  });

  Provider.of<StorePets>(context, listen: false).setPets(pets);

  return true;
}

removeStates() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("tutorial");
  prefs.remove("pets");
}

extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
