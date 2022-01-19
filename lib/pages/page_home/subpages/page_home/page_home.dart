import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/pet_picture.dart';
import 'widgets/task_view.dart';

class MainButtons extends StatelessWidget {
  const MainButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  (Theme.of(context).primaryColor),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              onPressed: () {},
              child: const SizedBox(
                height: 40,
                child: Center(
                  child: Text("VER TODOS",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.add),
                      Text("ADICIONAR PET",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    var pet = Provider.of<StorePets>(context).pets[0];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        // backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PageAddTask(),
          ),
        ),
        label: const Text('ADICIONAR TAREFA'),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("nome do app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(height: 10),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: PetPicture(pet: pet),
            ),
          ),
          const MainButtons(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: TaskViewer(pet: pet,),
              ),
            ),
          ),
          Container(
            height: 40,
          )
        ],
      ),
    );
  }
}
