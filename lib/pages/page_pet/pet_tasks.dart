import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/pages/page_home/subpages/page_task/page_task.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum option {
  a,
  b,
}

class PetTasks extends StatefulWidget {
  final String pet;
  const PetTasks({Key? key, required this.pet}) : super(key: key);

  @override
  State<PetTasks> createState() => _PetTasksState();
}

class _PetTasksState extends State<PetTasks> {
  @override
  Widget build(BuildContext context) {
    Widget Title(value) {
      var date = DateTime.parse(value);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          DateFormat('dd/MM/yyyy').format(date),
          style: TextStyle(fontSize: 15),
        ),
      );
    }

    Widget WTask(Task task) {
      return ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageTask(
              task: task,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        leading: Container(
          width: 70,
          height: 80,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(task.pet.petIconUrl),
            ),
            color: task.pet.color,
            shape: BoxShape.circle,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  task.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(height: 5),
                Text(
                  task.pet.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            PopupMenuButton<option>(
              onSelected: (option result) {
                setState(() {
                  switch (result) {
                    case option.a:
                      //call edit task
                      break;
                    case option.b:
                      Provider.of<StorePets>(context, listen: false).removeTask(task);
                      saveState(context);
                      break;
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<option>>[
                const PopupMenuItem<option>(
                  value: option.b,
                  child: Text('Apagar Tarefa'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Observer(builder: (context) {
      Provider.of<StorePets>(context, listen: false).actualPet;
      var pet = Provider.of<StorePets>(context, listen: false).getPetByName(widget.pet);
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text("Tarefas para ${pet.name}"),
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
          body: GroupedListView<dynamic, String>(
            elements: pet.tasks,
            groupBy: (element) => element.subTasks[0].dateToDo.toString(),
            groupSeparatorBuilder: (String groupByValue) => Title(groupByValue),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (context, dynamic element) => WTask(element),
          ));
    });
  }
}
