import 'package:equatable/equatable.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';

abstract class LoginEvent extends Equatable {}

class LoginWithEmailAndPassword extends LoginEvent {
  final LoginModel loginModel;
  LoginWithEmailAndPassword({
    required this.loginModel,
  });
  List<Object?> get props => [loginModel];
}
