import 'package:app_pets/pages/page%20pets/page_pets.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
        '/': (context) => const TabBarHandler()
};