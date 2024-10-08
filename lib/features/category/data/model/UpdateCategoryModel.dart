import '../../../../core/constants/error_model.dart';
import '../../domain/entity/update_category_entity.dart';

class UpdateCategoryModel extends UpdateCategoryEntity{
  UpdateCategoryModel({
      this.isSuccess, 
      this.errors, 
      this.data,});

  UpdateCategoryModel.fromJson(dynamic json) {
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

