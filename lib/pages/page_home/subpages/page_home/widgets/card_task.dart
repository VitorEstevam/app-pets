import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/pages/page_home/subpages/page_task/page_task.dart';
import 'package:app_pets/stores/example/store_global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    var _store = Provider.of<StoreGlobal>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox.fromSize(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageTask(
                  task: task,
                ),
              ),
            ),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 4,
                    // spreadRadius: 4,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: _store.pets[0].colorReference, // @TODO SELECTED PET COLOR
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(task.subTasks[0].dateToDo),
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(task.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
