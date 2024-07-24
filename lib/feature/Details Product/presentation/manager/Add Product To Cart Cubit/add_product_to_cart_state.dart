part of 'add_product_to_cart_cubit.dart';

sealed class AddProductToCartState {}

final class AddProductToCartInitial extends AddProductToCartState {}

final class AddProductToCartLoading extends AddProductToCartState {}

final class AddProductToCartSuccess extends AddProductToCartState {
  final AddedProductModel addedProductModel;

  AddProductToCartSuccess({required this.addedProductModel});
}

final class AddProductToCartFailure extends AddProductToCartState {
  final String errMessage;

  AddProductToCartFailure({required this.errMessage});
}
