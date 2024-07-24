import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/data/service/edit_delete_service.dart';

part 'delete_review_state.dart';

class DeleteReviewCubit extends Cubit<DeleteReviewState> {
  DeleteReviewCubit() : super(DeleteReviewInitial());
  changeLengthListReview({required int newLength}) {
    emit(DeleteReviewInitial());
  }

  Future<void> deleteReview({required String reviewId}) async {
    Either<ServerFailure, String> result =
        await EditAndDeleteReviewService().deleteComment(reviewId: reviewId);

    result.fold(
      (error) => emit(
        DeleteReviewFailure(
          error: error.toString(),
        ),
      ),
      (success) => emit(
        DeleteReviewSuccess(),
      ),
    );
  }
}
