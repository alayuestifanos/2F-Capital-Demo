import 'package:dartz/dartz.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';

import '../../../../core/error/failures.dart';

abstract class SignUpRepository {
  Future<Either<Failure, UserEntity>> signUp(UserEntity user);
}
