import 'package:fashion/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fashion/features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import '../../locator.dart';
import 'data/data_source/login_data_source.dart';
import 'data/data_source/register_data_source.dart';
import 'data/repository/auth_repo_impl.dart';
import 'domain/repository/auth_repo.dart';
import 'domain/use_cases/login_use_case.dart';
import 'domain/use_cases/register_use_case.dart';

initAuthInjection(){
  locator.registerFactory(() => AuthCubit(locator(), locator()));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  locator.registerLazySingleton<LoginDataSource>(() => LoginDataSource());
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(locator(),));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator(),));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(locator(),locator()));
}