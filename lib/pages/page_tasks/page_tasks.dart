import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/pages/page_tasks/tasks_by_date.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'tasks_by_pet.dart';

class PageTasks extends StatefulWidget {
  const PageTasks({Key? key}) : super(key: key);

  @override
  State<PageTasks> createState() => _PageTasksState();
}

class _PageTasksState extends State<PageTasks> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text("Tarefas"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Por data",
              ),
              Tab(
                text: "Por Pet",
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageAddTask(),
                      ),
                    ),
                icon: const Icon(Icons.add))
          ],
        ),
        body: const TabBarView(
          children: [
            ListTasksByDate(),
            ListTasksByPet(),
          ],
        ),
        //ListTasksByDate(),
      ),
    );
  }
}
