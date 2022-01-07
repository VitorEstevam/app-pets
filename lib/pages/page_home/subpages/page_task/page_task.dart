import 'package:app_pets/classes/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget getBodyByTaskType(Task task) {
  switch (task.runtimeType) {
    case TaskUnique:
      return BodyUnique(task: task);
    default:
      return Container();
  }
}

class BodyUnique extends StatelessWidget {
  final Task task;
  const BodyUnique({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _task = task as TaskUnique;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_task.title + " com luke", //trocar pro pet dinamico
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Container(height: 15),
          Text(
            DateFormat('dd/MM/yyyy').format(_task.subTask.dateToDo),
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class PageTask extends StatelessWidget {
  final Task task;

  const PageTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(task.title)), body: getBodyByTaskType(task));
  }
}
