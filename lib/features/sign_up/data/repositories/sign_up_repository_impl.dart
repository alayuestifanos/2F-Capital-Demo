import 'package:dartz/dartz.dart';
import 'package:two_f_demo/core/error/exceptions.dart';
import 'package:two_f_demo/core/error/failures.dart';
import 'package:two_f_demo/core/network/network_info.dart';
import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';
import 'package:two_f_demo/features/sign_up/domain/entities/user.dart';
import 'package:two_f_demo/features/sign_up/domain/repositories/sign_up_repository.dart';

import '../data_sources/sign_up_data_source.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource dataSource;
  final NetworkInfo networkInfo;
  SignUpRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> signUp(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dataSource.signUp(user as UserModel);
        return Right(response);
      } on UserExistException {
        return Left(
          UserExists(),
        );
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
