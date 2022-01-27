import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/consts/utils.dart';
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
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.91),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title + " com ${task.pet.name}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Container(height: 20),
              Text(
                task.subTitle,
                style: const TextStyle(fontSize: 15),
              ),
              Container(height: 5),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(

                    backgroundColor: Colors.orange,
                    avatar: const Icon(
                      Icons.local_fire_department,
                      color: Colors.yellow,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: Text(
                        "Sequência ${task.streak.toString()}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(height: 20),
              const Text("Frequência",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TaskCalendar(task),
                  ),
                ),
              )
            ],
          ),
        ),
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
      appBar: AppBar(title: Text("Tarefa")),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          label: const Text("Feita hoje"),
          icon: const Icon(Icons.check),
          onPressed: () => setState(() {
                widget.task.markAsDone();
                saveState(context);
              })),
      body: TaskBody(widget.task),
    );
  }
}
