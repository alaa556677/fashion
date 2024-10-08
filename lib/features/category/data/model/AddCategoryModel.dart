
import '../../../../core/constants/error_model.dart';
import '../../domain/entity/add_category_entity.dart';

class AddCategoryModel extends AddCategoryEntity{
  AddCategoryModel({
      bool? isSuccess,
      List<Errors>? errors,
      int? data,}){
    _isSuccess = isSuccess;
    _errors = errors;
    _data = data;
}

  AddCategoryModel.fromJson(dynamic json) {
    _isSuccess = json['isSuccess'];
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(Errors.fromJson(v));
      });
    }
    _data = json['data'];
  }
  bool? _isSuccess;
  List<Errors>? _errors;
  int? _data;

  bool? get isSuccess => _isSuccess;
  List<Errors>? get errors => _errors;
  int? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = _isSuccess;
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    map['data'] = _data;
    return map;
  }

}
