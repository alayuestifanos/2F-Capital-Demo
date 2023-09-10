import 'package:dartz/dartz.dart';
import 'package:two_f_demo/core/error/failures.dart';
import 'package:two_f_demo/core/use_case/use_case.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';
import 'package:two_f_demo/features/log_in/domain/repositories/log_in_repository.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';

class LoginUseCase implements UseCase<UserEntity, Params> {
  final LoginRepository loginRepository;
  LoginUseCase({
    required this.loginRepository,
  });

  @override
  Future<Either<Failure, UserModel>> call(Params params) async {
    return await loginRepository.login(params.loginModel);
  }
}

class Params {
  final LoginModel loginModel;
  Params({
    required this.loginModel,
  });
}
