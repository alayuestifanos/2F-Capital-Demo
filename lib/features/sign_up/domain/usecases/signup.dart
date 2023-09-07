import 'package:dartz/dartz.dart';
import 'package:two_f_demo/core/error/failures.dart';
import 'package:two_f_demo/core/use_case/use_case.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';
import 'package:two_f_demo/features/sign_up/domain/repositories/sign_up_repository.dart';

class SignUpUseCase implements UseCase<UserEntity, Params> {
  final SignUpRepository signUpRepository;
  SignUpUseCase({
    required this.signUpRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await signUpRepository.signUp(params.user);
  }
}

class Params {
  final UserEntity user;
  Params({
    required this.user,
  });
}
