import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_f_demo/core/error/exceptions.dart';
import 'package:two_f_demo/core/helper/shared_preferences_helper.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login(LoginModel loginModel);
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final SharedPreferences prefs;
  LoginDataSourceImpl({
    required this.auth,
    required this.firestore,
    required this.prefs,
  });
  @override
  Future<UserModel> login(LoginModel loginModel) => _logIn(loginModel);

  Future<UserModel> _logIn(LoginModel loginModel) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: loginModel.email!,
        password: loginModel.password!,
      );
      var result = await firestore.collection("users").get();
      var allUsers =
          result.docs.map((snapshot) => UserModel.fromDoc(snapshot)).toList();
      var user = allUsers.firstWhere(
        (user) => user.email == loginModel.email,
      );
      print("last part is reached");
      await SharedPreferencesHelper.saveUserToPrefs(user, prefs);
      return user;
    } catch (e) {
      print("Error is, ${e.toString()}");
      throw ServerException();
    }
  }
}
