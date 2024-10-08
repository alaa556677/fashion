
class ProductDataModel{
  final ProductModel productModel;
  final List <ProductColors> productColors;
  final String attributes;
  final String fullDescription;
  final SuppliersData suppliersData;
  ProductDataModel({
    required this.productModel,
    required this.productColors,
    required this.attributes,
    required this.suppliersData,
    required this.fullDescription
  });
}

class ProductModel{
  final String productName;
  final String description;
  final String price;
  final String imagePath;
  ProductModel({
    required this.imagePath,
    required this.productName,
    required this.description,
    required this.price
  });
}

class ProductColors{
  final String productColor;
  ProductColors({required this.productColor});
}

class SuppliersData{
  final String supplierName;
  final SupplierAddress supplierAddress;
  final String review;
  final String createFrom;
  final String description;
  SuppliersData({
    required this.supplierName,
    required this.supplierAddress,
    required this.review,
    required this.createFrom,
    required this.description
  });
}

class SupplierAddress{
  final String countryName;
  final String cityName;
  SupplierAddress({required this.countryName, required this.cityName});
}