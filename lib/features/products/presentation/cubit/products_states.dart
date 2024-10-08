abstract class ProductsStates{}

class InitialProductsState extends ProductsStates{}


class AddProductLoadingState extends ProductsStates{}

class AddProductFailureState extends ProductsStates{
  String message;
  AddProductFailureState(this.message);
}

class AddProductErrorState extends ProductsStates{
  String message;
  AddProductErrorState(this.message);
}

class AddProductSuccessState extends ProductsStates{}

class UploadImageLoading extends ProductsStates{}

class UploadImageSuccess extends ProductsStates{}

class UploadImageError extends ProductsStates{}

class GetCategoriesLoadingState extends ProductsStates{}

class GetCategoriesFailureState extends ProductsStates{}

class GetCategoriesErrorState extends ProductsStates{}

class GetCategoriesSuccessState extends ProductsStates{}

class ChangeSelectProduct extends ProductsStates{}

class UpdateProductLoadingState extends ProductsStates{}

class UpdateProductFailureState extends ProductsStates{
  String message;
  UpdateProductFailureState(this.message);
}

class UpdateProductErrorState extends ProductsStates{
  String message;
  UpdateProductErrorState(this.message);
}

class UpdateProductSuccessState extends ProductsStates{}

class DeleteProductLoadingState extends ProductsStates{}

class DeleteProductFailureState extends ProductsStates{
  String message;
  DeleteProductFailureState(this.message);
}

class DeleteProductErrorState extends ProductsStates{
  String message;
  DeleteProductErrorState(this.message);
}

class DeleteProductSuccessState extends ProductsStates{}

class GetProductLoadingState extends ProductsStates{}

class GetProductFailureState extends ProductsStates{
  String message;
  GetProductFailureState(this.message);
}

class GetProductErrorState extends ProductsStates{
  String message;
  GetProductErrorState(this.message);
}

class GetProductSuccessState extends ProductsStates{}