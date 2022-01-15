import 'package:app_pets/stores/example/store_global.dart';
import 'package:app_pets/stores/example/store_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../page_home.dart';
import 'card_task.dart';
import 'empty_tasks.dart';

class TaskViewer extends StatefulWidget {
  const TaskViewer({Key? key}) : super(key: key);

  @override
  State<TaskViewer> createState() => _TaskViewerState();
}

class _TaskViewerState extends State<TaskViewer> {
  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<StoreGlobal>(context).pets; /// @TODO Passar aqui o pet escolhido para inicar ele
    //final tasks = pet[0].tasks; // Provider.of<StoreTasks>(context);
    final tasks = Provider.of<StoreTasks>(context).tasks;

    return Observer(builder: (context) {
      return Container(
        child: tasks.isEmpty
            ? const EmptyTasks()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return CardTask(task: tasks[i]);
                },
              ),
      );
    });
  }
}