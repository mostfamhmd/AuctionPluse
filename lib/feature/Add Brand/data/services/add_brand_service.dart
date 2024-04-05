import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Add%20Brand/data/model/add_brand_model.dart';

class AddBrandService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, AddBrandModel>> addBrandServices(
      {required String name, required File photo}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    MultipartFile multipartFile = await MultipartFile.fromFile(
      photo.path,
      contentType: MediaType("image", "jpg"),
    );
    FormData formData = FormData.fromMap(
      {
        "image": multipartFile,
        "name": name,
      },
    );

    try {
      Map<String, dynamic> response = await dioHelper.postRequest(
          body: formData, endPoint: "brands", token: token);
      AddBrandModel addBrandModel = AddBrandModel.fromJson(response);
      return right(addBrandModel);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(dioException: e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
