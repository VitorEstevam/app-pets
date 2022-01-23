import 'package:app_pets/classes/tasks/task.dart';
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

class ListTasksByPet extends StatefulWidget {
  const ListTasksByPet({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTasksByPet> createState() => _ListTasksByPetState();
}

class _ListTasksByPetState extends State<ListTasksByPet> {
  @override
  Widget build(BuildContext context) {
    Widget Title(value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          value,
          style: TextStyle(fontSize: 15),
        ),
      );
    }

    Widget WTask(Task task) {
      return ListTile(
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
                  DateFormat('dd/MM/yyyy').format(task.subTasks[0].dateToDo),
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
                      //call remove task
                      break;
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<option>>[
                const PopupMenuItem<option>(
                  value: option.a,
                  child: Text('Editar Tarefa'),
                ),
                const PopupMenuItem<option>(
                  child: Text('Apagar Tarefa'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Observer(builder: (context) {
      var pets = Provider.of<StorePets>(context).pets;

      List<Task> tasks = pets
          .map((pet) => pet.tasks.toList())
          .toList()
          .expand((task) => task)
          .toList();

      return GroupedListView<dynamic, String>(
        elements: tasks,
        groupBy: (element) => element.pet.name,
        groupSeparatorBuilder: (String groupByValue) => Title(groupByValue),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, dynamic element) => WTask(element),
      );
    });
  }
}
