import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/login_entity.dart';
import '../entity/register_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,RegisterEntity>> register(int role,String userName,String email , String password);
  Future<Either<Failure,LoginEntity>> login(String email , String password);
}