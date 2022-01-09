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
    final tasks = Provider.of<StoreTasks>(context);
    return Observer(builder: (context) {
      return Container(
        child: tasks.tasks.isEmpty
            ? const EmptyTasks()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: tasks.tasks.length,
                itemBuilder: (context, i) {
                  return CardTask(task: tasks.tasks[i]);
                },
              ),
      );
    });
  }
}