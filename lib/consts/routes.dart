import 'package:app_pets/pages/page_home/subpages/page_home/page_home.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
        '/': (context) => const TabBarHandler()
};