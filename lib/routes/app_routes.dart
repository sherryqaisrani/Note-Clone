import 'package:flutter/material.dart';
import 'package:note_clone/screens/recycle_bin.dart';
import 'package:note_clone/screens/task_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());

      case TaskScreen.id:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      default:
        return null;
    }
  }
}
