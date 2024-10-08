import '../../../../core/shared/dio_helper.dart';
import '../model/UpdateCategoryModel.dart';

class UpdateCategoryDataSource{
  Future <UpdateCategoryModel> updateCategory(
      String name , int id
      ) async {
    final result = await DioHelper.postData(
        url: 'api/Category/Update',
        data: {
          "name": name,
          'id': id
        }
    );
    return UpdateCategoryModel.fromJson(result.data);
  }
}