abstract class CategoryStates{}

class InitialCategoryState extends CategoryStates{}

class AddCategoryLoadingState extends CategoryStates{}

class AddCategoryFailureState extends CategoryStates{}

class AddCategoryErrorState extends CategoryStates{}

class AddCategorySuccessState extends CategoryStates{}

class UpdateCategoryLoadingState extends CategoryStates{}

class UpdateCategoryFailureState extends CategoryStates{
  String errorMessage;
  UpdateCategoryFailureState(this.errorMessage);
}

class UpdateCategoryErrorState extends CategoryStates{
  String errorMessage;
  UpdateCategoryErrorState(this.errorMessage);
}

class UpdateCategorySuccessState extends CategoryStates{}

class DeleteCategoryLoadingState extends CategoryStates{}

class DeleteCategoryFailureState extends CategoryStates{
  String errorMessage;
  DeleteCategoryFailureState(this.errorMessage);
}

class DeleteCategoryErrorState extends CategoryStates{
  String errorMessage;
  DeleteCategoryErrorState(this.errorMessage);
}

class DeleteCategorySuccessState extends CategoryStates{}

class GetCategoriesLoadingState extends CategoryStates{}

class GetCategoriesFailureState extends CategoryStates{}

class GetCategoriesErrorState extends CategoryStates{}

class GetCategoriesSuccessState extends CategoryStates{}
