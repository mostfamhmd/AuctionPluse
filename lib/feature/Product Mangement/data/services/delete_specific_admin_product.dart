import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';

class DeleteSpecificProduct {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, String>> deleteSpecificProduct(
      {required String productId}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      await dioHelper.deleteRequest(
          endPoint: "products/$productId", token: token);
      return right(
        "Deleted successfully",
      );
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(
          dioException: dioException,
        ),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }
}
