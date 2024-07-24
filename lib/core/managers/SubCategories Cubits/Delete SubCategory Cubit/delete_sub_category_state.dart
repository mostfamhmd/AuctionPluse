part of 'delete_sub_category_cubit.dart';

sealed class DeleteSubCategoryState {}

final class DeleteSubCategoryInitial extends DeleteSubCategoryState {}

final class DeleteSubCategoryLoading extends DeleteSubCategoryState {}

final class DeleteSubCategorySuccess extends DeleteSubCategoryState {
  final String success;

  DeleteSubCategorySuccess({required this.success});
}

final class DeleteSubCategoryError extends DeleteSubCategoryState {
  final String error;

  DeleteSubCategoryError({required this.error});
}
