import 'package:app_pets/pages/page_home/subpages/page_home/page_home.dart';
import 'package:app_pets/pages/page_home/subpages/page_task/page_task.dart';
import 'package:app_pets/pages/page_news/subpages/page_news.dart';
import 'package:app_pets/pages/page_pet/page_pets.dart';
import 'package:app_pets/pages/page_tasks/page_tasks.dart';
import 'package:app_pets/widgets/tab_view_navigator.dart';
import 'package:flutter/material.dart';

class TabBarHandler extends StatelessWidget {
  const TabBarHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey.shade700,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.menu_book_rounded, size: 30),
              text: "noticias",
            ),
            Tab(
              icon: Icon(Icons.directions_run, size: 30),
              text: "tarefas",
            ),
            Tab(
              icon: Icon(Icons.home, size: 30),
              text: "inicio",
            ),
            Tab(
              icon: Icon(Icons.pets, size: 30),
              text: "pets",
            ),
          ],
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              TabViewNavigator(
                builder: (context) {
                  return const PageNews();
                },
              ),
              TabViewNavigator(
                builder: (context) {
                  return PageTasks();
                },
              ),
              TabViewNavigator(
                builder: (context) {
                  return const PageHome();
                },
              ),
              TabViewNavigator(
                builder: (context) {
                  return PagePets();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
