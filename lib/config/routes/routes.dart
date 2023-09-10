import 'package:flutter/material.dart';

import '../../features/log_in/presentation/pages/pages.dart';
import '../../features/sign_up/presentation/pages/pages.dart';

class AppRoutes {
  static Route go({required Widget to}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return to;
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return go(
          to: Register(),
        );
      case Login.routeName:
        return go(
          to: Login(),
        );
      // case Homepage.routeName:
      //   return go(
      //     to: const Homepage(),
      //   );
      default:
        return go(
          to: Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text(
                "Error Occurred",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}
