import 'package:app_pets/counter.dart';
import 'package:app_pets/page1.dart';
import 'package:app_pets/page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Counter>(
          create: (_) => Counter(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Page1(title: "my app 1"),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Page2(title: "my app 2"),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
