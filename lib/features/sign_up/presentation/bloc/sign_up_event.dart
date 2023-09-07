import 'package:equatable/equatable.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';

abstract class SignUpEvent extends Equatable {}

class SignUp extends SignUpEvent {
  final UserEntity user;

  SignUp({required this.user});

  @override
  List<Object?> get props => [user];
}
