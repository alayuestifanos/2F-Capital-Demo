import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    final DocumentReference? id,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? phone,
    final String? password,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          password: password,
        );

  factory UserModel.fromDoc(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.reference,
      firstName: snapshot["firstName"],
      lastName: snapshot["lastName"],
      email: snapshot["email"],
      phone: snapshot["phone"],
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    String path = json["id"].split("(").last.split(")").first;
    DocumentReference<Map<String, dynamic>> docRef =
        FirebaseFirestore.instance.doc(path);
    return UserModel(
      id: docRef,
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id.toString(),
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phone": phone,
    };
  }
}
