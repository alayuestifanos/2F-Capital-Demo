import 'package:dartz/dartz.dart';
import 'package:two_f_demo/core/error/exceptions.dart';
import 'package:two_f_demo/core/error/failures.dart';
import 'package:two_f_demo/core/network/network_info.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';
import 'package:two_f_demo/features/log_in/domain/repositories/log_in_repository.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';

import '../data_sources/log_in_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;
  LoginRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> login(LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dataSource.login(loginModel);
        return Right(response);
      } on ServerException {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      return Left(
        NotConnected(),
      );
    }
  }
}
