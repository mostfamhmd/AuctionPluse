part of 'update_sub_category_cubit.dart';

sealed class UpdateSubCategoryState {}

final class UpdateSubCategoryInitial extends UpdateSubCategoryState {}

final class UpdateSubCategoryLoading extends UpdateSubCategoryState {}

final class UpdateSubCategorySuccess extends UpdateSubCategoryState {
  final String success;

  UpdateSubCategorySuccess({required this.success});
}

final class UpdateSubCategoryError extends UpdateSubCategoryState {
  final String error;

  UpdateSubCategoryError({required this.error});
}
