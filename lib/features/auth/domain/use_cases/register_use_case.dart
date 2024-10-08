import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/register_entity.dart';
import '../repository/auth_repo.dart';

class RegisterUseCase{
  final AuthRepository authRepo;

  RegisterUseCase(this.authRepo);

  Future<Either<Failure,RegisterEntity>> call(int role,String userName,String email , String password)async{
    return await authRepo.register(role, userName, email, password);
  }
}