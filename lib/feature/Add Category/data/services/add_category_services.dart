import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Add%20Category/data/model/add_category_model.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

class AddCategoryServices {
  DioHelper dioHelper = DioHelper();
  Dio dio = Dio();

  Future<Either<ServerFailure, AddCategoryModel>> addCategoryService({
    required String name,
    required File photo,
  }) async {
    MultipartFile multiPart = await MultipartFile.fromFile(
      photo.path,
      contentType: MediaType('image', 'jpeg'),
    );
    FormData formData = FormData.fromMap(
      {
        "image": multiPart,
        "name": name,
      },
    );
    try {
      Map<String, dynamic> response = await dioHelper.postRequest(
        body: formData,
        endPoint: "category",
        token: AppConsts.kToken,
      );

      AddCategoryModel addCategoryModel = AddCategoryModel.fromJson(response);
      return right(addCategoryModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
