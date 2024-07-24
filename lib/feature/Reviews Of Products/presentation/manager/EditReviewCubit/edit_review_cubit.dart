import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/data/model/edited_review_model.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/data/service/edit_delete_service.dart';

part 'edit_review_state.dart';

class EditReviewCubit extends Cubit<EditReviewState> {
  EditReviewCubit() : super(EditReviewInitial());

  Future<void> editReview(
      {required String reviewId,
      required String comment,
      required num ratings}) async {
    emit(EditReviewLoading());
    Either<ServerFailure, EditReviewModel> result =
        await EditAndDeleteReviewService()
            .editComment(reviewId: reviewId, ratings: ratings, title: comment);
    result.fold(
      (serverFailure) {
        emit(EditReviewFailure(error: serverFailure.toString()));
      },
      (editReviewModel) {
        emit(EditReviewSuccess(editReviewModel: editReviewModel));
      },
    );
  }
}
