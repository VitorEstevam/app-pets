import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/pages/page_home/subpages/page_task/page_task.dart';
import 'package:app_pets/widgets/task_streak_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTask extends StatefulWidget {
  final Color color;
  const CardTask({
    Key? key,
    required this.task,
    this.color = Colors.grey,
  }) : super(key: key);

  final Task task;

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.7;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: SizedBox.fromSize(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageTask(
                  task: widget.task,
                ),
              ),
            ),
            child: Container(
              width: size,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * 0.3),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: widget.color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(20, -20),
                    child: Row(
                      children: [
                        if (widget.task.streak > 0)
                          TaskStreakChip(
                            task: widget.task,
                            hideName: true,
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(widget.task.subTasks[0].dateToDo),
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(widget.task.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
