import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/entity/register_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_source/login_data_source.dart';
import '../data_source/register_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRepositoryImpl(
    this.registerDataSource,
    this.loginDataSource
  );
  RegisterDataSource registerDataSource;
  LoginDataSource loginDataSource;
////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, RegisterEntity>> register(int role, String userName, String email, String password)async {
    try {
      return Right(await registerDataSource.register(role,userName,email, password));
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }
////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password)async {
    try {
      return Right(await loginDataSource.login(email, password));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

}