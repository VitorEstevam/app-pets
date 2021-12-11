
import 'package:app_pets/pages/page_home.dart';
import 'package:flutter/material.dart';

class TabBarHandler extends StatelessWidget {
  const TabBarHandler({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(

          child: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.purple,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("It's cloudy here"),
              ),
              PageHome(),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
