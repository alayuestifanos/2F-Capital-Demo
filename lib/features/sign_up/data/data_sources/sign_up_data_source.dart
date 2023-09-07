import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_f_demo/core/error/exceptions.dart';
import 'package:two_f_demo/core/helper/helper_service.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

import 'package:collection/collection.dart';

abstract class SignUpDataSource {
  Future<UserModel> signUp(UserModel user);
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final SharedPreferences prefs;
  SignUpDataSourceImpl({
    required this.auth,
    required this.firestore,
    required this.prefs,
  });
  @override
  Future<UserModel> signUp(UserModel user) => _signUp(user);

  Future<UserModel> _signUp(UserModel user) async {
    try {
      var collectionRef = firestore.collection("users");
      var response = await collectionRef.get();
      var allUsers = response.docs.map(
        (user) => UserModel.fromDoc(user),
      );
      var userFromDB = allUsers.firstWhereOrNull(
          (u) => u.email == user.email || user.phone == u.phone);
      if (userFromDB != null) {
        print("user Exists Exception");
        throw UserExistException();
      }
      await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await collectionRef.add({
        ...user.toJson(),
        "password": HelperServices.hashPassword(user.password!)
      });
      // await SharedPreferencesHelper.saveUserToPrefs(user, prefs);

      return user;
    } on UserExistException {
      throw UserExistException();
    } catch (e) {
      print("Error is, ${e.toString()}");
      throw ServerException();
    }
  }
}
