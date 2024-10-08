import '../../../../core/shared/dio_helper.dart';
import '../model/delete_product_model.dart';

class DeleteProductDataSource {

  Future<DeleteProductModel> deleteCategory(
      int id,
      ) async {
    final result = await DioHelper.postData(
        url: 'api/Product/Delete',
        query: {
          'id': id
        }
    );
    return DeleteProductModel.fromJson(result.data);
  }

}
