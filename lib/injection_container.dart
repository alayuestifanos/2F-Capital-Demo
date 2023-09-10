import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_f_demo/core/network/network_info.dart';
import 'package:two_f_demo/features/log_in/data/data_sources/log_in_data_source.dart';
import 'package:two_f_demo/features/log_in/data/repositories/log_in_repository_impl.dart';
import 'package:two_f_demo/features/log_in/domain/repositories/log_in_repository.dart';
import 'package:two_f_demo/features/log_in/domain/usecases/login.dart';
import 'package:two_f_demo/features/log_in/presentation/bloc/login_bloc.dart';
import 'package:two_f_demo/features/sign_up/data/data_sources/sign_up_data_source.dart';
import 'package:two_f_demo/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:two_f_demo/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:two_f_demo/features/sign_up/domain/usecases/signup.dart';
import 'package:two_f_demo/features/sign_up/presentation/bloc/sign_up_bloc.dart';

final sl = GetIt.instance;

Future<void> main() async {
  //External Dependencies
  //Firebase Auth
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  //Firebase firestore
  sl.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  sl.registerSingleton<InternetConnectionChecker>(
    InternetConnectionChecker(),
  );
  //Shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(
      sl(),
    ),
  );
  //Data Sources
  sl.registerSingleton<SignUpDataSource>(
    SignUpDataSourceImpl(
      auth: sl(),
      firestore: sl(),
      prefs: sl(),
    ),
  );
  sl.registerSingleton<LoginDataSource>(
    LoginDataSourceImpl(
      auth: sl(),
      firestore: sl(),
      prefs: sl(),
    ),
  );
  //Repositories
  sl.registerSingleton<SignUpRepository>(
    SignUpRepositoryImpl(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Use Cases
  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      signUpRepository: sl(),
    ),
  );
  sl.registerSingleton<LoginUseCase>(
    LoginUseCase(
      loginRepository: sl(),
    ),
  );

  //Blocs
  sl.registerFactory<SignUpBloc>(
    () => SignUpBloc(
      sl(),
    ),
  );
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: sl(),
    ),
  );
}
