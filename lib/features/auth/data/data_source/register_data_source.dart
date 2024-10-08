import '../../../../core/shared/dio_helper.dart';
import '../model/register_model.dart';

class RegisterDataSource{
  Future <RegisterModel> register(
      int role,String userName,String email , String password
      ) async {
    final result = await DioHelper.postData(
        url: 'api/Auth/Register',
        data: {
          "role" : role,
          "userName" : userName,
          "email" : email,
          "password" : password,
        }
    );
    return RegisterModel.fromJson(result.data);
  }
}
