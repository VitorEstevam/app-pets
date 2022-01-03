import 'package:app_pets/pages/page%20pets/page_pets.dart';
import 'package:app_pets/pages/page%20pets/subpages/page_add_task.dart';
import 'package:flutter/material.dart';

class RouterPagePet extends StatefulWidget {
  const RouterPagePet({Key? key}) : super(key: key);

  @override
  _RouterPagePetState createState() => _RouterPagePetState();
}

class _RouterPagePetState extends State<RouterPagePet> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const PagePets();
        if (settings.name == 'page_pets') page = const PagePets();
        if (settings.name == 'page_add_task') page = const PageAddTask();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
