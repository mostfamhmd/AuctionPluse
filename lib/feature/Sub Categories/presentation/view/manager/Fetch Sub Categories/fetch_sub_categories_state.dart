part of 'fetch_sub_categories_cubit.dart';

sealed class FetchSubCategoriesState {}

final class FetchSubCategoriesLoading extends FetchSubCategoriesState {}

final class FetchSubCategoriesSuccess extends FetchSubCategoriesState {
  final SubCategoriesModel subCategoriesModel;
  FetchSubCategoriesSuccess({required this.subCategoriesModel});
}

final class FetchSubCategoriesFailed extends FetchSubCategoriesState {
  final String error;

  FetchSubCategoriesFailed({required this.error});
}
