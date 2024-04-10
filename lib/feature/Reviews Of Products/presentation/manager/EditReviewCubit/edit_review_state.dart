part of 'edit_review_cubit.dart';

sealed class EditReviewState {}

final class EditReviewInitial extends EditReviewState {}

final class EditReviewSuccess extends EditReviewState {
  final EditReviewModel editReviewModel;

  EditReviewSuccess({required this.editReviewModel});
}

final class EditReviewFailure extends EditReviewState {
  final String error;

  EditReviewFailure({required this.error});
}

final class EditReviewLoading extends EditReviewState {}
