import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/debug_config.dart';
import 'package:app_pets/pages/page_home/onboarding/onboard_intro.dart';
import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/foundation.dart';
// import 'package:app_pets/stores/example/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/consts/provider_stores.dart';

bool once = false;
void runDebug(BuildContext context) {
  if (!once || kDebugMode) {
    once = true;
    var pet = Pet("Luke", "lib/assets/dog_icon_creation.png", Colors.green);
    Provider.of<StorePets>(context).addNewPet(pet);
    var task = TaskUnique("dar banho", pet, DateTime(2022, 01, 23));
    Provider.of<StorePets>(context).addNewTaskToPet(pet, task);
  }
}

Widget startingAppRoute(BuildContext context) {
  var tutorialDone = true; //todo change to the shared prefs
  var pets = Provider.of<StorePets>(context).pets;
  
  if (!tutorialDone) {
    return const OnboardingIntro();
  } else if (pets.isEmpty) {
    return CreatePetIntro();
  } else {
    return const TabBarHandler();
  }
}

void main() {
  runApp(
    MultiProvider(providers: providerStores, child: const AppRoot()),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    runDebug(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Pets',
      theme: theme,
      home: startingAppRoute(context),
    );
  }
}
