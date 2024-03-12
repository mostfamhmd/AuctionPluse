part of 'add_category_cubit.dart';

sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}

final class AddCategoryLoading extends AddCategoryState {}

final class AddCategorySuccess extends AddCategoryState {
  final AddCategoryModel addCategoryModel;

  AddCategorySuccess({required this.addCategoryModel});
}

final class AddCategoryFailed extends AddCategoryState {
  final String error;

  AddCategoryFailed({required this.error});
}
