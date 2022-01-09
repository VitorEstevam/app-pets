import 'package:app_pets/classes/task.dart';
import 'package:app_pets/pages/page_home/subpages/page_home/page_home.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:flutter/material.dart';

import 'subpages/page_task/page_task.dart';

class RouterPageHome extends StatefulWidget {
  const RouterPageHome({Key? key}) : super(key: key);

  @override
  _RouterPageHomeState createState() => _RouterPageHomeState();
}

class _RouterPageHomeState extends State<RouterPageHome>
    with AutomaticKeepAliveClientMixin<RouterPageHome> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const PageHome();
        if (settings.name == 'page_pets') page = const PageHome();
        if (settings.name == 'page_add_task') page = const PageAddTask();
        if (settings.name == 'page_task')
          page = PageTask(
            task: settings.arguments as Task,
          );
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
