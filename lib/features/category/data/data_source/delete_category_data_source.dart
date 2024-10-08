import '../../../../core/shared/dio_helper.dart';
import '../model/delete_category_model.dart';

class DeleteCategoryDataSource{
  Future <DeleteCategoryModel> deleteCategory(int id) async
  {
    final result = await DioHelper.postData(
        url: 'api/Category/Delete',
        query: {
          'id': id
        }
    );
    return DeleteCategoryModel.fromJson(result.data);
  }
}