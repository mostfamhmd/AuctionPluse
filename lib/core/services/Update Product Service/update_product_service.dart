import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';

class UpdateProductService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, String>> updateProductService({
    required String? productId,
    String? productName,
    String? productDescription,
    String? productPrice,
    String? productDiscount,
    String? productQuantity,
    String? categoryId,
    List<String>? listSubCategoryId,
    String? brandId,
    dynamic imageFile,
    List<dynamic>? listImageFile,
    List<String>? colors,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    dynamic imageCoverMultipart = imageFile is File
        ? await MultipartFile.fromFile(
            imageFile.path,
            contentType: MediaType('imageCover', 'jpeg'),
          )
        : imageFile;
    List<dynamic> multiParts = [];
    for (int i = 0; i < listImageFile!.length; i++) {
      dynamic image = listImageFile[i] is File
          ? await MultipartFile.fromFile(
              listImageFile[i].path,
              contentType: MediaType('image$i', 'jpeg'),
            )
          : listImageFile[i];
      multiParts.add(image);
    }
    FormData formData = FormData.fromMap(
      {
        "name": productName,
        "price": productPrice,
        "quantity": productQuantity,
        "imageCover": imageCoverMultipart,
        "images": multiParts,
        "description": productDescription,
        "colors": colors,
        "category": categoryId,
        "discountedPrice": productDiscount,
        "subcategories": listSubCategoryId,
        "brand": brandId,
      },
    );
    try {
      await dioHelper.putRequest(
        endPoint: "products/$productId",
        token: token,
        body: formData,
      );
      return right("Updated Successfully");
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(
        dioException: dioException,
      ));
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }
}
