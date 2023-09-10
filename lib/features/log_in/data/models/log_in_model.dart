import 'package:two_f_demo/features/log_in/domain/entities/login.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    final String? email,
    final String? password,
    final String? id,
  }) : super(
          email: email,
          password: password,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
