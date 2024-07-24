part of 'get_cart_product_cubit.dart';

sealed class GetCartProductState {}

final class GetCartProductInitial extends GetCartProductState {}

final class GetCartProductLoading extends GetCartProductState {}

final class GetCartProductSuccess extends GetCartProductState {
  final GetCartModel getCartModel;

  GetCartProductSuccess({required this.getCartModel});
}

final class GetCartProductFailure extends GetCartProductState {
  final String serverFailure;

  GetCartProductFailure({required this.serverFailure});
}
