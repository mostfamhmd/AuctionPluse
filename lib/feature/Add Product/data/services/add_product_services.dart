import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:smart_auction/feature/Add%20Product/data/model/add_product_model.dart';

class AddProductServices {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, AddProductModel>> addCategoryService(
      {required String name,
      required String description,
      required File imageCover,
      required List<File> images,
      required String brandId,
      required String categoryId,
      required List<String> subCategoriesId,
      required String realPrice,
      required String discountedPrice,
      required String quantity,
      required List<String> colors}) async {
    MultipartFile imageCoverMultipart = await MultipartFile.fromFile(
      imageCover.path,
      contentType: MediaType('imageCover', 'jpeg'),
    );
    List<MultipartFile> multiParts = [];
    for (int i = 0; i < images.length; i++) {
      MultipartFile image = await MultipartFile.fromFile(
        images[i].path,
        contentType: MediaType('image$i', 'jpeg'),
      );
      multiParts.add(image);
    }
    FormData formData = FormData.fromMap(
      {
        "name": name,
        "price": realPrice,
        "quantity": quantity,
        "imageCover": imageCoverMultipart,
        "images": multiParts,
        "description": description,
        "colors": colors,
        "category": categoryId,
        "discountedPrice": discountedPrice,
        "subcategories": subCategoriesId,
        "brand": brandId,
      },
    );
    try {
      Map<String, dynamic> response = await dioHelper.postRequest(
        body: formData,
        endPoint: "products",
        token: AppConsts.kToken,
      );

      AddProductModel addProductModel = AddProductModel.fromJson(response);
      return right(addProductModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
