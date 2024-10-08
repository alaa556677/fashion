import '../../../../core/constants/error_model.dart';

class DeleteProductEntity {
  DeleteProductEntity({
    this.isSuccess,
    this.errors,
    this.data,});

  bool? isSuccess;
  List<Errors>? errors;
  bool? data;


}
