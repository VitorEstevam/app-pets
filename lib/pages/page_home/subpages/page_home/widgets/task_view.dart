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
    final widgets = tasks.map((task) => CardTask(task: task, color: widget.pet.color)).toList();
    final list = ListView(physics: const BouncingScrollPhysics(), scrollDirection: Axis.horizontal, children: widgets);

    bool ended = false;

    Future getFutureDados() async => await Future.delayed(
          const Duration(milliseconds: 1),
          () {
            ended = true;
          },
        );

    return FutureBuilder(
        future: getFutureDados(),
        builder: (context, _) {
          return Container(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: tasks.isEmpty
                  ? EmptyTasks(name: widget.pet.name)
                  : AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: ended ? list : Container(),
                    ),
            ),
          );
        });
  }
}
