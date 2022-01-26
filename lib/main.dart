import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/debug_config.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/foundation.dart';
// import 'package:app_pets/stores/example/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/consts/provider_stores.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool once = false;
bool debug = true;
void runDebug(BuildContext context) {
  if (!once && kDebugMode && debug) {
    once = true;
    debugOptions(context);
  }
}

dynamic getIntroState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? _res = prefs.getBool("tutorial");

  return _res ?? false;
}

Future<Widget> startingAppRoute(BuildContext context) async {
  var tutorialDone = await getIntroState(); 
  var a = await Provider.of<StorePets>(context, listen: false).loadPets();
  var pets = Provider.of<StorePets>(context, listen: false).pets;

  if (!tutorialDone) {
    return const OnboardingIntro();
  } else if (pets.isEmpty) {
    return PageCreatePet();
  } else {
    return const TabBarHandler();
  }
}

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
      home: FutureBuilder<Widget>(
        future: startingAppRoute(context),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          return snapshot.hasData ? snapshot.data! : Container();
        },
      ),
    );
  }
}
