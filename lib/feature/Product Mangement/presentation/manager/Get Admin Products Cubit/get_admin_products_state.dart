part of 'get_admin_products_cubit.dart';

sealed class GetAdminProductsState {}

final class GetAdminProductsInitial extends GetAdminProductsState {}

final class GetAdminProductsLoading extends GetAdminProductsState {}

final class GetAdminProductsSuccess extends GetAdminProductsState {
  final ProductsModel productsModel;

  GetAdminProductsSuccess({required this.productsModel});
}

final class GetAdminProductsFailure extends GetAdminProductsState {
  final String message;

  GetAdminProductsFailure({required this.message});
}
