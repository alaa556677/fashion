import '../../../../core/constants/error_model.dart';
import '../../domain/entity/register_entity.dart';

// ignore: must_be_immutable
class RegisterModel extends RegisterEntity{

  RegisterModel({super.isSuccess, super.errors, super.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    data['data'] = this.data;
    return data;
  }
}

