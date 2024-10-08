import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../domain/entity/categories_entity.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/categories_use_case.dart';
import '../../domain/use_cases/delete_category_use_case.dart';
import '../../domain/use_cases/update_category_use_case.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit <CategoryStates>{
  CategoryCubit(this.addCategoryUseCase,this.updateCategoryUseCase
      ,this.deleteCategoryUseCase,this.allCategoriesUseCase) : super(InitialCategoryState());

  static final CategoryCubit _categoryCubit = BlocProvider.of<CategoryCubit>(navigatorKey.currentState!.context);
  static CategoryCubit get instance => _categoryCubit;

////////////////////////////////////////////////////////////////////////////////

  AddCategoryUseCase addCategoryUseCase;

  addCategory({required String name}) async {
    emit(AddCategoryLoadingState());
    final result = await addCategoryUseCase(name);
    result.fold((failure) {
      emit(AddCategoryFailureState());
    },(addCategory) {
      if (addCategory.isSuccess == true) {
        emit(AddCategorySuccessState());
      } else {
        emit(AddCategoryErrorState());
      }
    });
  }
////////////////////////////////////////////////////////////////////////////////
  UpdateCategoryUseCase updateCategoryUseCase;

  updateCategory({required String name , required int id }) async {
    emit(UpdateCategoryLoadingState());
    final result = await updateCategoryUseCase(name,id);
    result.fold((failure) {
      emit(UpdateCategoryFailureState(failure.errorMessage));
    },(update) {
      if (update.isSuccess == true) {
        emit(UpdateCategorySuccessState());
      } else {
        emit(UpdateCategoryErrorState(update.errors!.first.message!));
      }
    });
  }

////////////////////////////////////////////////////////////////////////////////
  DeleteCategoryUseCase deleteCategoryUseCase;

  deleteCategory({required int id }) async {
    emit(DeleteCategoryLoadingState());
    final result = await deleteCategoryUseCase(id);
    result.fold((failure) {
      emit(DeleteCategoryFailureState(failure.errorMessage));
    },(delete) {
      if (delete.isSuccess == true) {
        emit(DeleteCategorySuccessState());
      } else {
        emit(DeleteCategoryErrorState(delete.errors!.first.message!));
      }
    });
  }

////////////////////////////////////////////////////////////////////////////////
  AllCategoriesUseCase allCategoriesUseCase;
  CategoriesEntity? categoriesEntity;

  getAllCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await allCategoriesUseCase();
    result.fold((failure) {
      emit(GetCategoriesFailureState());
    },(category) {
      if (category.isSuccess == true) {
        categoriesEntity = category;
        emit(GetCategoriesSuccessState());
      } else {
        emit(GetCategoriesErrorState());
      }
    });
  }
}