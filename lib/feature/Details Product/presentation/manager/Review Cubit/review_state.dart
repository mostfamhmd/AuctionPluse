part of 'review_cubit.dart';

sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewSuccess extends ReviewState {
  final ReviewModel reviewModel;

  ReviewSuccess({required this.reviewModel});
}

final class ReviewFailure extends ReviewState {
  final String errorMessage;

  ReviewFailure({required this.errorMessage});
}
