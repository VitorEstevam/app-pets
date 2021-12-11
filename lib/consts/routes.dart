import 'package:app_pets/pages/page_home.dart';
import 'package:app_pets/pages/pages.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
        '/': (context) => const TabBarHandler()
};