import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_f_demo/core/error/failures.dart';
import 'package:two_f_demo/features/log_in/domain/usecases/login.dart';
import 'package:two_f_demo/features/log_in/presentation/bloc/login_event.dart';
import 'package:two_f_demo/features/log_in/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginWithEmailAndPassword>(_login);
  }

  void _login(LoginWithEmailAndPassword event, Emitter<LoginState> emit) async {
    emit(
      LoginLoading(),
    );
    try {
      var response = await loginUseCase(
        Params(
          loginModel: event.loginModel,
        ),
      );
      response.fold(
          (error) => emit(
                LoginFailed(
                  message: error.props.first.toString(),
                ),
              ), (user) {
        //Shared Preferences
        emit(
          LoginSuccess(user: user),
        );
      });
    } on NotConnected {
      emit(
        LoginFailed(message: "Please connect your device to internet"),
      );
    } catch (e) {
      print("error is ${e.toString()}");
      emit(
        LoginFailed(message: "Server Error"),
      );
    }
  }
}
