import '../../../../core/shared/dio_helper.dart';
import '../model/CategoriesModel.dart';

class AllCategoriesDataSource{
  Future <CategoriesModel> getAllCategories(
      ) async {
    final result = await DioHelper.getData(
        url: 'api/Category/CetAll',
    );
    return CategoriesModel.fromJson(result.data);
  }
}