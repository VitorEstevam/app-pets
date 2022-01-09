import 'package:flutter/material.dart';

class PageNewsView extends StatefulWidget {
  const PageNewsView({ Key? key }) : super(key: key);

  @override
  _PageNewsViewState createState() => _PageNewsViewState();
}

class _PageNewsViewState extends State<PageNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("testing"),),
      floatingActionButton: FloatingActionButton(onPressed: ()=>{Navigator.pushNamed(context, "page_pets")},),
    );
  }
}