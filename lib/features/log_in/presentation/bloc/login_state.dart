import 'package:equatable/equatable.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
