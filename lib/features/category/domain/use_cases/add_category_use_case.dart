import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/add_category_entity.dart';
import '../repository/category_repository.dart';

class AddCategoryUseCase{
  final CategoryRepo repository;

  AddCategoryUseCase(this.repository);

  Future<Either<Failure, AddCategoryEntity>> call(
      String name,
      ) async {
    return await repository.addCategory(name,);
  }
}

