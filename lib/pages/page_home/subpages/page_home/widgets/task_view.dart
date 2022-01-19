import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../page_home.dart';
import 'card_task.dart';
import 'empty_tasks.dart';

class TaskViewer extends StatefulWidget {
  final Pet pet;
  const TaskViewer({Key? key, required this.pet}) : super(key: key);

  @override
  State<TaskViewer> createState() => _TaskViewerState();
}

class _TaskViewerState extends State<TaskViewer> {
  @override
  Widget build(BuildContext context) {
    final tasks = widget.pet.tasks;

    return Observer(builder: (context) {
      return Container(
        child: tasks.isEmpty
            ? const EmptyTasks()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return CardTask(task: tasks[i], color: widget.pet.colorReference);
                },
              ),
      );
    });
  }
}