part of 'delete_product_cart_cubit.dart';

sealed class DeleteProductCartState {}

final class DeleteProductCartInitial extends DeleteProductCartState {}

final class DeleteProductCartLoading extends DeleteProductCartState {}

final class DeleteProductCartSuccess extends DeleteProductCartState {
  final DeleteProductFromCart deleteProductFromCart;

  DeleteProductCartSuccess({required this.deleteProductFromCart});
}

final class DeleteProductCartError extends DeleteProductCartState {
  final String errorMessage;

  DeleteProductCartError({required this.errorMessage});
}
