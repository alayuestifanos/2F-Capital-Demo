import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final DocumentReference? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        password,
      ];
}
