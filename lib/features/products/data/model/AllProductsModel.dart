import '../../../../core/constants/error_model.dart';
import '../../domain/entity/all_products_entity.dart';

class AllProductsModel extends AllProductsEntity{
  AllProductsModel({
      this.isSuccess, 
      this.errors, 
      this.data,});

  AllProductsModel.fromJson(dynamic json) {
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
        data?.add(AllProductsData.fromJson(v));
      });
    }
  }
  bool? isSuccess;
  List<Errors>? errors;
  List<AllProductsData>? data;

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

class AllProductsData {
  AllProductsData({
      this.id, 
      this.name, 
      this.price, 
      this.discount, 
      this.fileStorageId, 
      this.categoryId, 
      this.isDeleted, 
      this.createdOn, 
      this.updatedOn,});

  AllProductsData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    fileStorageId = json['fileStorageId'];
    categoryId = json['categoryId'];
    isDeleted = json['isDeleted'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }
  num? id;
  String? name;
  num? price;
  num? discount;
  num? fileStorageId;
  num? categoryId;
  bool? isDeleted;
  String? createdOn;
  String? updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['discount'] = discount;
    map['fileStorageId'] = fileStorageId;
    map['categoryId'] = categoryId;
    map['isDeleted'] = isDeleted;
    map['createdOn'] = createdOn;
    map['updatedOn'] = updatedOn;
    return map;
  }

}

