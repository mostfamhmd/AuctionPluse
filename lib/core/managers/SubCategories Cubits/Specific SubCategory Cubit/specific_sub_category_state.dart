part of 'specific_sub_category_cubit.dart';

sealed class SpecificSubCategoryState {}

final class SpecificSubCategoryInitial extends SpecificSubCategoryState {}

final class SpecificSubCategoryLoading extends SpecificSubCategoryState {}

final class SpecificSubCategorySuccess extends SpecificSubCategoryState {
  final SpecificSubCategoryModel specificSubCategoryList;
  SpecificSubCategorySuccess({
    required this.specificSubCategoryList,
  });
}

final class SpecificSubCategoryError extends SpecificSubCategoryState {
  final String errMessage;
  SpecificSubCategoryError({
    required this.errMessage,
  });
}
