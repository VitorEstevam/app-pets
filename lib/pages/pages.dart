
import 'package:app_pets/pages/page_pets.dart';
import 'package:flutter/material.dart';

class TabBarHandler extends StatelessWidget {
  const TabBarHandler({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey.shade700,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.menu_book_rounded, size:30),
              ),
              Tab(
                icon: Icon(Icons.pets, size:30),
              ),
              Tab(
                icon: Icon(Icons.settings, size:30),
              ),
            ],
          ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("Noticias"),
              ),
              PagePets(),
              Center(
                child: Text("Configs"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
