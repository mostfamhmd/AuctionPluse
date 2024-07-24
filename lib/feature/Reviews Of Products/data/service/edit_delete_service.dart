import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/data/model/edited_review_model.dart';

class EditAndDeleteReviewService {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, String>> deleteComment(
      {required String reviewId}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String data = "Deleted successfully";
    try {
      if (kDebugMode) {
        print(reviewId);
      }
      await dioHelper.deleteRequest(
        endPoint: "reviews/$reviewId",
        token: token,
      );
      return right(data);
    } on DioException catch (dioException) {
      return left(ServerFailure(errMessage: dioException.toString()));
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, EditReviewModel>> editComment({
    required String reviewId,
    required num ratings,
    required String title,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.putRequest(
        endPoint: "reviews/$reviewId",
        token: token,
        body: {
          "ratings": ratings,
          "title": title,
        },
      );
      EditReviewModel editReviewModel = EditReviewModel.fromJson(data);
      return right(editReviewModel);
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
