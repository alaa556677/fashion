import '../../../../core/constants/error_model.dart';

class AddCategoryEntity {
  AddCategoryEntity({
    bool? isSuccess,
    List<Errors>? errors,
    int? data,}){
    _isSuccess = isSuccess;
    _errors = errors;
    _data = data;
  }

  bool? _isSuccess;
  List<Errors>? _errors;
  int? _data;

  bool? get isSuccess => _isSuccess;
  List<Errors>? get errors => _errors;
  int? get data => _data;



}
