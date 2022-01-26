import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class EmptyTasks extends StatelessWidget {
  final String name;
  const EmptyTasks({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0.0),
      child: Column(
        children: [
          const Expanded(
            child: FittedBox(
              // fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter,
              child: ImageLoader("lib/assets/no_tasks.png"),
            ),
          ),
          Container(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Não há tarefas para ${name}... Vamos começar adicionando uma!",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}