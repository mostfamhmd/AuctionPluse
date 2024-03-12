// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';

class FetchAllSubCategories {
  DioHelper dio = DioHelper();

  Future<Either<ServerFailure, SubCategoriesModel>>
      fetchAllSubCategories() async {
    SubCategoriesModel subCategoriesModel = SubCategoriesModel();
    try {
      Map<String, dynamic> data = await dio.getRequest(
        endPoint: "subcategory",
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWU2NjcyYzQ4Mjc3ZjQxM2E5MDMyYzMiLCJpYXQiOjE3MDk3NDcxOTYsImV4cCI6MTcxNzUyMzE5Nn0.vo5-hc8-2KTJ4b1uzA6q8VKK9BBSbjavFu25dyKHBwM",
      );
      subCategoriesModel = SubCategoriesModel.fromJson(data);
      return right(subCategoriesModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
