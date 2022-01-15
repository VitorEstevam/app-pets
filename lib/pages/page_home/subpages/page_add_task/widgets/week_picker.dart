import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekPicker extends StatefulWidget {
  final void Function(List<int> arr) callback;
  const WeekPicker({Key? key, required this.callback}) : super(key: key);

  @override
  State<WeekPicker> createState() => _WeekPickerState();
}

class _WeekPickerState extends State<WeekPicker> {
  var isSelected = [false, false, false, false, false, false, false];
  // days = [1, 2, 3, 4, 5, 6, 7];

  List<int> getWeekDays() {
    List<int> week = [];

    for (var i = 0; i < 7; i++) {
      var item = isSelected[i];
      if (item) {
        week.add(i + 1);
      }
    }
    return week;
  }

  void handleInput(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });

    widget.callback(getWeekDays());
  }

  var textstyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Text(
          "S",
          style: textstyle,
        ),
        Text(
          "T",
          style: textstyle,
        ),
        Text(
          "Q",
          style: textstyle,
        ),
        Text(
          "Q",
          style: textstyle,
        ),
        Text(
          "S",
          style: textstyle,
        ),
        Text(
          "S",
          style: textstyle,
        ),
        Text(
          "D",
          style: textstyle,
        ),
      ],
      color: Theme.of(context).primaryColor,
      selectedColor: Theme.of(context).primaryColor,
      isSelected: isSelected,
      onPressed: (i) => handleInput(i),
    );
  }
}
