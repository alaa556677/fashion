import '../../../../core/constants/error_model.dart';
import '../../domain/entity/categories_entity.dart';

class CategoriesModel extends CategoriesEntity{
  CategoriesModel({
      this.isSuccess, 
      this.errors, 
      this.data,});

  CategoriesModel.fromJson(dynamic json) {
    isSuccess = json['isSuccess'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesData.fromJson(v));
      });
    }
  }
  bool? isSuccess;
  List<Errors>? errors;
  List<CategoriesData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = isSuccess;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CategoriesData {
  CategoriesData({
      this.id, 
      this.name, 
      this.isDeleted, 
      this.createdOn, 
      this.updatedOn,});

  CategoriesData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }
  num? id;
  String? name;
  bool? isDeleted;
  String? createdOn;
  String? updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['isDeleted'] = isDeleted;
    map['createdOn'] = createdOn;
    map['updatedOn'] = updatedOn;
    return map;
  }
  @override
  @override
  String toString() {
    return name!;
  }

}

