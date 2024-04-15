// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';

class FetchAllSubCategories {
  DioHelper dio = DioHelper();

  Future<Either<ServerFailure, SubCategoriesModel>>
      fetchAllSubCategories() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dio.getRequest(
        endPoint: "subcategory",
        token: token,
      );
      SubCategoriesModel subCategoriesModel = SubCategoriesModel.fromJson(data);
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
