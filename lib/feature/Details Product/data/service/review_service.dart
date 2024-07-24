import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

class ReviewService {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, ReviewModel>> getAllReviews() async {
    ReviewModel reviewModel = ReviewModel();
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "reviews",
      );
      reviewModel = ReviewModel.fromJson(data);
      return right(reviewModel);
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
