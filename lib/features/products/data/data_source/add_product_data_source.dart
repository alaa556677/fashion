import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

import '../../../../core/shared/dio_helper.dart';
import '../model/AddProductModel.dart';

class AddProductDataSource {
  Uint8List? imageByte1;
  List<int> listData = [];
  String fileName = '';

  Future<AddProductModel> addCategory(
    String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,
  ) async {
    // if (isImageExist == false) {
    String extension = fileName.split('.').last.toLowerCase();
    String mimeType = extension == "png" ? "image/png" : "image/jpeg";
      Uint8List? imageByte1 = imageByte;
      listData = imageByte1!.cast();
      fileName = image.path.split('/').last;
    // }
    FormData data = FormData.fromMap({
      "Name": name,
      "Price": price,
      "Description": description,
      "Discount": discount,
      "CategoryId": categoryId,
      "File": await MultipartFile.fromBytes(listData, filename: fileName, contentType: MediaType("image", mimeType)),
    });

    final result = await DioHelper.postMultiPartData(
      url: 'api/Product/Create',
      data: data,
    );

    return AddProductModel.fromJson(result.data);
  }

}
