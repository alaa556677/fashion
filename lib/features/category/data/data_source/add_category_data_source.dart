import '../../../../core/shared/dio_helper.dart';
import '../model/AddCategoryModel.dart';

class AddCategoryDataSource{
  Future <AddCategoryModel> addCategory(
      String name ,
      ) async {
    final result = await DioHelper.postData(
        url: 'api/Category/Create',
        data: {
          "name": name,
        }
    );
    return AddCategoryModel.fromJson(result.data);
  }
}