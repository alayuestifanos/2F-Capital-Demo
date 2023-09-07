import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/sign_up/data/models/user_model.dart';

class SharedPreferencesHelper {
  static const String userKey = 'user_key';

  static Future<void> saveUserToPrefs(
      UserModel user, SharedPreferences prefs) async {
    final userJson = user.toJson();
    print("user json is");
    print(userJson);
    final userJsonString = jsonEncode(userJson);

    prefs.setString(userKey, userJsonString);
  }

  static Future<void> removeUserFromPrefs(
      String key, SharedPreferences prefs) async {
    await prefs.remove(key);
  }

  static Future<UserModel?> getUserFromPrefs(SharedPreferences prefs) async {
    final userJsonString = prefs.getString(userKey);
    if (userJsonString != null) {
      final userJson = jsonDecode(userJsonString);
      return UserModel.fromJson(userJson);
    } else {
      return null;
    }
  }
}
