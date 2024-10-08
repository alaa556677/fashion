import '../../../../core/constants/error_model.dart';
import '../../data/model/CategoriesModel.dart';

class CategoriesEntity {
  CategoriesEntity({
    this.isSuccess,
    this.errors,
    this.data,});

  bool? isSuccess;
  List<Errors>? errors;
  List<CategoriesData>? data;



}
