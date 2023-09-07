import 'package:equatable/equatable.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';

abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  final UserEntity user;

  SignUpSuccess({required this.user});

  @override
  List<Object?> get props => [
        user,
      ];
}

class SignUpFailed extends SignUpState {
  final String message;
  SignUpFailed({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}
