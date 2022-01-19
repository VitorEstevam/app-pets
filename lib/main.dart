import 'package:app_pets/debug_config.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var _store_global = Provider.of<StorePets>(context);

    runDebug(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Pets',
      theme: theme,
      home: _store_global.starting_app_route(),
    );
  }
}
