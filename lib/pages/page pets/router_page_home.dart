import 'package:app_pets/pages/page%20pets/page_home.dart';
import 'package:app_pets/pages/page%20pets/subpages/page_add_task/page_add_task.dart';
import 'package:flutter/material.dart';

class RouterPageHome extends StatefulWidget {
  const RouterPageHome({Key? key}) : super(key: key);

  @override
  _RouterPageHomeState createState() => _RouterPageHomeState();
}

class _RouterPageHomeState extends State<RouterPageHome> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const PageHome();
        if (settings.name == 'page_pets') page = const PageHome();
        if (settings.name == 'page_add_task') page = const PageAddTask();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
