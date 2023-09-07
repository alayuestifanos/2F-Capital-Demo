import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_f_demo/features/sign_up/domain/usecases/signup.dart';
import 'package:two_f_demo/features/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:two_f_demo/features/sign_up/presentation/bloc/sign_up_state.dart';

import '../../../../core/error/failures.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpBloc(this._signUpUseCase)
      : super(
          SignUpInitial(),
        ) {
    on<SignUp>(onSignUpEvent);
  }

  void onSignUpEvent(SignUp event, Emitter<SignUpState> emit) async {
    try {
      emit(
        SignUpLoading(),
      );
      var result = await _signUpUseCase(
        Params(
          user: event.user,
        ),
      );
      result.fold((error) {
        if (error is UserExists) {
          emit(
            SignUpFailed(message: "Email/Phone is taken"),
          );
        } else {
          emit(
            SignUpFailed(message: "Failed to register user"),
          );
        }
      }, (user) {
        emit(
          SignUpSuccess(user: user),
        );
      });
    } catch (e) {
      print("Error is sign up bloc");
      print(
        e.toString(),
      );
      emit(
        SignUpFailed(message: "Server Error"),
      );
    }
  }
}
