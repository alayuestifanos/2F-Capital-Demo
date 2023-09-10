import 'package:dartz/dartz.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> login(LoginModel loginEntity);
}
