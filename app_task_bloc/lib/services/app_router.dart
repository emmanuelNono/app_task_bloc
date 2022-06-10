import 'package:app_task_bloc/screens/my_drawer/recycle_bin.dart';
import 'package:flutter/material.dart';

import '../screens/tasks/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
