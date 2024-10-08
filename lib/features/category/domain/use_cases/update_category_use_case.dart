import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/update_category_entity.dart';
import '../repository/category_repository.dart';

class UpdateCategoryUseCase{
  final CategoryRepo repository;

  UpdateCategoryUseCase(this.repository);

  Future<Either<Failure, UpdateCategoryEntity>> call(
      String name,int id
      ) async {
    return await repository.updateCategory(name,id);
  }
}

