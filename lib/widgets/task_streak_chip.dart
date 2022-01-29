import 'package:app_pets/classes/tasks/task.dart';
import 'package:flutter/material.dart';

class TaskStreakChip extends StatelessWidget {
  final bool hideName;
  final Task task;

  const TaskStreakChip({Key? key, required this.task, this.hideName = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String val = !hideName ? "Sequência " : "";
    val += task.streak.toString();
    return Chip(
      backgroundColor: Colors.orange,
      avatar: const Icon(
        Icons.local_fire_department,
        color: Colors.yellow,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Text(
          val,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
