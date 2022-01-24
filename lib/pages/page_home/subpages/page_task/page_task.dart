import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/task_calendar.dart';

class TaskBody extends StatelessWidget {
  final Task task;
  const TaskBody(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    task.updateSubTasks();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title + " com ${task.pet.name}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Container(height: 15),
          Text(
            task.subTitle,
            style: const TextStyle(fontSize: 15),
          ),
          Text("Frequência ${task.streak}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TaskCalendar(task)
        ],
      ),
    );
  }
}

class PageTask extends StatefulWidget {
  final Task task;

  const PageTask({Key? key, required this.task}) : super(key: key);

  @override
  State<PageTask> createState() => _PageTaskState();
}

class _PageTaskState extends State<PageTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.task.title)),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          label: const Text("Feita hoje"),
          icon: const Icon(Icons.check),
          onPressed: () => setState(() {
                widget.task.markAsDone();
              })),
      body: TaskBody(widget.task),
    );
  }
}
