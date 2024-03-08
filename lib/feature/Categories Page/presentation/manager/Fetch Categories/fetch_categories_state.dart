part of 'fetch_categories_cubit.dart';

sealed class FetchCategoriesState {}

final class FetchCategoriesLoading extends FetchCategoriesState {}

final class FetchCategoriesSuccess extends FetchCategoriesState {
  final CategoriesModel getCategories;
  FetchCategoriesSuccess({
    required this.getCategories,
  });
}

final class FetchCategoriesFailed extends FetchCategoriesState {
  final String error;

  FetchCategoriesFailed({required this.error});
}
