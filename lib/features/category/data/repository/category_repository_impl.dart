import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../../domain/entity/add_category_entity.dart';
import '../../domain/entity/categories_entity.dart';
import '../../domain/entity/delete_category_entity.dart';
import '../../domain/entity/update_category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/add_category_data_source.dart';
import '../data_source/categories_data_source.dart';
import '../data_source/delete_category_data_source.dart';
import '../data_source/update_category_data_source.dart';

class CategoryRepoImpl implements CategoryRepo{

  CategoryRepoImpl(this.addCategoryDataSource,this.allCategoriesDataSource,
      this.updateCategoryDataSource,this.deleteCategoryDataSource);

  AddCategoryDataSource addCategoryDataSource;
  AllCategoriesDataSource allCategoriesDataSource;
  UpdateCategoryDataSource updateCategoryDataSource;
  DeleteCategoryDataSource deleteCategoryDataSource;
  @override
  Future<Either<Failure, AddCategoryEntity>> addCategory(String name) async{
    try {
      return Right(await addCategoryDataSource.addCategory(name));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesEntity>> getAllCategories() async{
    try {
      return Right(await allCategoriesDataSource.getAllCategories());
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateCategoryEntity>> updateCategory(String name, int id) async{
    try {
      return Right(await updateCategoryDataSource.updateCategory(name , id ));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteCategoryEntity>> deleteCategory(int id)async {
    try {
      return Right(await deleteCategoryDataSource.deleteCategory(id));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

}