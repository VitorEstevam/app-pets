import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_pets/consts/routes.dart';
import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/consts/provider_stores.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providerStores,
      child: const AppRoot(),
    ),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Pets',
        theme: theme,
        initialRoute: '/',
        routes: routes);
  }
}
