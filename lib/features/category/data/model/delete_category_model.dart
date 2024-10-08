import '../../../../core/constants/error_model.dart';
import '../../domain/entity/delete_category_entity.dart';

class DeleteCategoryModel extends DeleteCategoryEntity{
  DeleteCategoryModel({
    this.isSuccess,
    this.errors,
    this.data,});

  DeleteCategoryModel.fromJson(dynamic json) {
    isSuccess = json['isSuccess'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
    data = json['data'];
  }
  bool? isSuccess;
  List<Errors>? errors;
  bool? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = isSuccess;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['data'] = data;
    return map;
  }

}

