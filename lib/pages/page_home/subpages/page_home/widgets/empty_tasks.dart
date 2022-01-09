import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';

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