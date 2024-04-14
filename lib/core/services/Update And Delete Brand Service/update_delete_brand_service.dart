import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';

class UpdateDeleteBrandService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, String>> deleteBrand({
    required String brandId,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      await dioHelper.deleteRequest(
        endPoint: "barand/$brandId",
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

  Future<Either<ServerFailure, String>> updateBrand({
    required String brandId,
    required dynamic image,
    String? name,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    FormData formData = FormData();
    if (image is File) {
      MultipartFile multipartFile = await MultipartFile.fromFile(
        image.path,
        contentType: MediaType('imageBrandUpdated', 'jpeg'),
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
        endPoint: "category/$brandId",
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
