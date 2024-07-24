import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Details%20Product/data/service/review_service.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());
  Future<void> getAllReviews() async {
    emit(
      ReviewLoading(),
    );
    Either<ServerFailure, ReviewModel> result =
        await ReviewService().getAllReviews();

    result.fold(
      (serverFailureMessage) => emit(
        ReviewFailure(
          errorMessage: serverFailureMessage.errMessage,
        ),
      ),
      (reviewModel) => emit(
        ReviewSuccess(
          reviewModel: reviewModel,
        ),
      ),
    );
  }
}
