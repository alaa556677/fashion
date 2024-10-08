import 'package:equatable/equatable.dart';

import '../../../../core/constants/error_model.dart';

// ignore: must_be_immutable
class RegisterEntity extends Equatable{

  RegisterEntity({
    this.isSuccess,
    this.errors,
    this.data,
  });

  bool? isSuccess;
  List<Errors>? errors;
  bool? data;

  @override
  List<Object?> get props => [isSuccess , data, errors];
}
