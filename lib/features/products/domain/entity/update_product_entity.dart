import '../../../../core/constants/error_model.dart';

class UpdateProductEntity {
  UpdateProductEntity({
    this.isSuccess,
    this.errors,
    this.data,});

  bool? isSuccess;
  List<Errors>? errors;
  bool? data;


}
