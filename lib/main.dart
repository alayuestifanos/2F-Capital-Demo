import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_f_demo/config/routes/routes.dart';
import 'package:two_f_demo/config/theme/app_themes.dart';
import 'package:two_f_demo/core/helper/shared_preferences_helper.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';
import 'package:two_f_demo/features/sign_up/presentation/pages/register.dart';

import "injection_container.dart" as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.main();
  var user =
      await SharedPreferencesHelper.getUserFromPrefs(sl<SharedPreferences>());
  runApp(
    App(
      user: user,
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Register(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
