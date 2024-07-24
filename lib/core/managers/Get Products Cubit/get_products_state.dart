part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final ProductsModel productsModel;

  GetProductsSuccess({required this.productsModel});
}

final class GetProductsFailure extends GetProductsState {
  final String error;

  GetProductsFailure({required this.error});
}
