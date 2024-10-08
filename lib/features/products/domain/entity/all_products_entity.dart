import '../../../../core/constants/error_model.dart';
import '../../data/model/AllProductsModel.dart';

class AllProductsEntity {
  AllProductsEntity({
    this.isSuccess,
    this.errors,
    this.data,});

  bool? isSuccess;
  List<Errors>? errors;
  List<AllProductsData>? data;


}
