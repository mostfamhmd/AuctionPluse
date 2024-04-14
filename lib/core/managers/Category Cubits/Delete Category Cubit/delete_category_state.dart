part of 'delete_category_cubit.dart';

sealed class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoading extends DeleteCategoryState {}

final class DeleteCategorySuccess extends DeleteCategoryState {
  final String success;

  DeleteCategorySuccess({required this.success});
}

final class DeleteCategoryError extends DeleteCategoryState {
  final String error;

  DeleteCategoryError({required this.error});
}
