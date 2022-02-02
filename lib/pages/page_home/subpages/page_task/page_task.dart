import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/task_streak_chip.dart';
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
        // constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.91),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title + " com ${task.pet.name}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
              Container(height: 10),
              Text(
                task.subTitle,
                style: const TextStyle(fontSize: 15),
              ),
              Container(height: 10),
              if (task.streak > 0)
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TaskStreakChip(task: task),
                  ),
                ),
              if (task.streak > 0) Container(height: 20),
              const Text("Frequência", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TaskCalendar(task),
                ),
              ),
              Container(height: 45),
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
  Widget fab() {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).primaryColor,
      label: const Text("Feita hoje"),
      icon: const Icon(Icons.check),
      onPressed: () => setState(
        () {
          widget.task.markAsDone();
          saveState(context);
        },
      ),
    );
  }

  Widget? getFAB() {
    var isToday = compareDates(widget.task.subTasks[0].dateToDo, DateTime.now()) == 0;
    var isUndone = widget.task.subTasks[0].done == false;
    return isToday && isUndone ? fab() : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarefa")),
      floatingActionButton: getFAB(),
      body: TaskBody(widget.task),
    );
  }
}
