part of 'delete_review_cubit.dart';

sealed class DeleteReviewState {}

final class DeleteReviewInitial extends DeleteReviewState {}

final class DeleteReviewSuccess extends DeleteReviewState {}

final class DeleteReviewFailure extends DeleteReviewState {
  final String error;

  DeleteReviewFailure({required this.error});
}
