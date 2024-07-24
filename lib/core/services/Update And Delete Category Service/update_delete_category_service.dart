import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';

class UpdateDeleteCategoryService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, String>> deleteCategory({
    required String categoryId,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      await dioHelper.deleteRequest(
        endPoint: "category/$categoryId",
        token: token,
      );
      return right("Deleted Successfully");
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, String>> updateCategory({
    required String categoryId,
    required dynamic image,
    String? name,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    FormData formData = FormData();
    if (image is File) {
      MultipartFile multipartFile = await MultipartFile.fromFile(
        image.path,
        contentType: MediaType('imageCategoryUpdated', 'jpeg'),
      );
      formData = FormData.fromMap(
        {
          "name": name,
          "image": multipartFile,
        },
      );
    } else if (image is String) {
      formData = FormData.fromMap(
        {
          "name": name,
          "image": image,
        },
      );
    }
    try {
      await dioHelper.putRequest(
        endPoint: "category/$categoryId",
        token: token,
        body: formData,
      );
      return right("Updated Successfully");
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
