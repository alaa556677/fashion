import '../../../../core/shared/dio_helper.dart';
import '../model/AllProductsModel.dart';

class AllProductDataSource {

  Future<AllProductsModel> getAllCategories() async {
    final result = await DioHelper.getData(
        url: 'api/Product/CetAll',
    );
    return AllProductsModel.fromJson(result.data);
  }

}
