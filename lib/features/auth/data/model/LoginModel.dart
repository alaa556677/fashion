import '../../../../core/constants/error_model.dart';
import '../../domain/entity/login_entity.dart';

class LoginModel  extends LoginEntity{
  LoginModel({
      this.isSuccess, 
      this.errors, 
      this.data,});

  LoginModel.fromJson(dynamic json) {
    isSuccess = json['isSuccess'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
  bool? isSuccess;
  List<Errors>? errors;
  LoginData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = isSuccess;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class LoginData {
  LoginData({
      this.token, 
      this.refreshToken, 
      this.role, 
      this.refreshDateExpiration,});

  LoginData.fromJson(dynamic json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    role = json['role'];
    refreshDateExpiration = json['refreshDateExpiration'];
  }
  String? token;
  String? refreshToken;
  String? role;
  String? refreshDateExpiration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    map['role'] = role;
    map['refreshDateExpiration'] = refreshDateExpiration;
    return map;
  }

}

