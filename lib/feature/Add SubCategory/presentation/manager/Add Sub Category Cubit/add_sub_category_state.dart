part of 'add_sub_category_cubit.dart';

sealed class AddSubCategoryState {}

final class AddSubCategoryInitial extends AddSubCategoryState {}

final class AddSubCategoryLoading extends AddSubCategoryState {}

final class AddSubCategorySuccess extends AddSubCategoryState {
  final AddSubCategoryModel addSubCategoryModel;

  AddSubCategorySuccess({required this.addSubCategoryModel});
}

final class AddSubCategoryFailure extends AddSubCategoryState {
  final String error;

  AddSubCategoryFailure({required this.error});
}
