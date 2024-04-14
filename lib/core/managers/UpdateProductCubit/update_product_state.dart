part of 'update_product_cubit.dart';

sealed class UpdateProductState {}

final class UpdateProductInitial extends UpdateProductState {}

final class UpdateProductLoading extends UpdateProductState {}

final class UpdateProductSuccess extends UpdateProductState {
  final String success;

  UpdateProductSuccess({required this.success});
}

final class UpdateProductFailure extends UpdateProductState {
  final String failure;

  UpdateProductFailure({required this.failure});
}
