import 'package:app_pets/pages/page_home/router_page_home.dart';
import 'package:app_pets/pages/page_home/subpages/page_home/page_home.dart';
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
          child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Center(
                child: Text("Noticias"),
              ),
              Center(
                child: Text("tarefas"),
              ),
              RouterPageHome(),
              Center(
                child: Text("pets"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
