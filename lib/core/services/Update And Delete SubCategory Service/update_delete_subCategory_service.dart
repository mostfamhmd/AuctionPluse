// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';

class UpdateDeleteSubCategoryService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, String>> deleteSubCategory({
    required String subCategoryId,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      await dioHelper.deleteRequest(
        endPoint: "subcategory/$subCategoryId",
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

  Future<Either<ServerFailure, String>> updateSubCategory({
    required String subCategoryId,
    String? categoryId,
    String? name,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      await dioHelper.putRequest(
        endPoint: "category/$categoryId",
        token: token,
        body: {
          "name": name,
          "category": categoryId,
        },
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
