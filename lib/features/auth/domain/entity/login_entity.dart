import 'package:equatable/equatable.dart';
import '../../../../core/constants/error_model.dart';
import '../../data/model/LoginModel.dart';

class LoginEntity extends Equatable {
  LoginEntity({
    this.isSuccess,
    this.errors,
    this.data,});

  bool? isSuccess;
  List<Errors>? errors;
  LoginData? data;

  @override
  // TODO: implement props
  List<Object?> get props => [isSuccess , data, errors];

}
