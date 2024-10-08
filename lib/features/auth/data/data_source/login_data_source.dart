import '../../../../core/shared/dio_helper.dart';
import '../model/LoginModel.dart';

class LoginDataSource{
  Future <LoginModel> login(
      String email , String password
      ) async {
    final result = await DioHelper.postData(
        url: 'api/Auth/Login',
        data: {
          "email" : email,
          "password" : password,
        }
    );
    return LoginModel.fromJson(result.data);
  }
}
