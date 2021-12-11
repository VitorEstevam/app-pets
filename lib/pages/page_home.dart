import 'package:app_pets/stores/example/example.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/src/provider.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Meus Pets"),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  Expanded(
                    child: Container(
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
                ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    const FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomCenter,
                      child: ImageLoader("lib/assets/placeholderTask.png"),
                    ),
                    Container(height: 20),
                    const Text(
                      "Não há tarefas para Luke... Vamos começar adicionando uma!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(height: 20),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          Text("ADICIONAR TAREFA"),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
