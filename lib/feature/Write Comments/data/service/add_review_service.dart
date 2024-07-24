import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Write%20Comments/data/Model/my_review_model.dart';

class AddReviewService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, MyReview>> addNewComment(
      {required String title,
      required String product,
      required num ratings}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String userId = await AppConsts.getData(AppConsts.kUserId);

    MyReview myReview = MyReview();
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        endPoint: "reviews",
        body: {
          "ratings": ratings,
          "title": title,
          "product": product,
          "user": userId,
        },
        token: token,
      );

      myReview = MyReview.fromJson(data);
      return right(myReview);
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
