part of 'update_product_cart_cubit.dart';

sealed class UpdateProductCartState {}

final class UpdateProductCartInitial extends UpdateProductCartState {}

final class UpdateProductCartLoading extends UpdateProductCartState {}

final class UpdateProductCartSuccess extends UpdateProductCartState {
  final UpdateProductInCart updateProductInCart;

  UpdateProductCartSuccess({required this.updateProductInCart});
}

final class UpdateProductCartError extends UpdateProductCartState {
  final String errorMessage;

  UpdateProductCartError({required this.errorMessage});
}
