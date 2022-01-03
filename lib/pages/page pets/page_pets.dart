import 'dart:convert';

import 'package:app_pets/classes/task.dart';
import 'package:app_pets/pages/page%20pets/subpages/page_add_task.dart';
import 'package:app_pets/stores/example/store_tasks.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/src/provider.dart';

class PagePets extends StatelessWidget {
  const PagePets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Meus Pets"),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.train_sharp)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: const PetsPart(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: const TaskPart(),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskPart extends StatefulWidget {
  const TaskPart({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskPart> createState() => _TaskPartState();
}

class _TaskPartState extends State<TaskPart> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: const TaskViewer()),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "page_add_task");
              },
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text("ADICIONAR TAREFA"),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

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
            : Container(
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: tasks.tasks.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Container(
                        child: Text(json.encode(tasks.tasks[i].title))),
                  );
                },
              )),
      );
    });
  }
}

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.topCenter,
            child: ImageLoader("lib/assets/placeholderTask.png"),
          ),
        ),
        Container(height: 10),
        const Text(
          "Não há tarefas para Luke... Vamos começar adicionando uma!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class PetsPart extends StatelessWidget {
  const PetsPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
          foregroundDecoration: const BoxDecoration(
            color: Colors.grey,
            backgroundBlendMode: BlendMode.saturation,
          ),
          child: const FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomCenter,
            child: ImageLoader("lib/assets/dog1.jpeg"),
          ),
        ),
      ),
      const Text(
        "Luke",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      )
    ]);
  }
}
