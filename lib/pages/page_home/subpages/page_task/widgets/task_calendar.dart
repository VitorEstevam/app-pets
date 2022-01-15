import 'dart:collection';

import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/locale.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskCalendar extends StatefulWidget {
  final Task task;
  const TaskCalendar(this.task, {Key? key}) : super(key: key);

  @override
  _TaskCalendarState createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  late LinkedHashMap<DateTime, List<bool>> tasks;

  List<bool> getTasks(DateTime day) {
    return tasks[day] ?? [];
  }

  Color getEventColor(DateTime date) {
    var status = widget.task.getStatus();
    
    if (tasks[date]![0]) {
      return Colors.green;
    } else {
      if (compareDates(date, DateTime.now()) < 0) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }

  Widget? getEventMarker(BuildContext context, DateTime date, dynamic? Object) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getEventColor(date),
      ),
      height: 15,
      width: 15,
      margin: const EdgeInsets.symmetric(horizontal: 1.5),
    );
  }

  CalendarBuilders getBuilders() {
    return CalendarBuilders(
      todayBuilder: (context, date, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(width: 2, color: Colors.grey),
              ),
              child: Center(
                child: Text(date.day.toString()),
              )),
        );
      },
      markerBuilder: (context, date, _) {
        var task = getTasks(date);
        return task.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getEventColor(date),
                  ),
                  child: Center(
                    child: Text(date.day.toString()),
                  ),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    tasks = widget.task.toMap();
    initializeDateFormatting("pt_BR");
    return TableCalendar(
        pageJumpingEnabled: true,
        locale: 'pt_BR',
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        firstDay: DateTime.utc(2022, 01, 01),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.utc(2022, 01, 01),
        eventLoader: (day) {
          return getTasks(day);
        },
        calendarBuilders: getBuilders());
  }
}
