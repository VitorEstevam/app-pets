import 'package:app_pets/classes/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    var _task = task as TaskUnique;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox.fromSize(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                  // spreadRadius: 4,
                  offset: Offset(0, 1), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.lightGreen, // pet color here
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(_task.subTask.dateToDo),
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(_task.title,
                      style: const TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
