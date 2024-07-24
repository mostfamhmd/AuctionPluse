import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/update_product_cart.dart';
import 'package:smart_auction/feature/Cart%20Page/data/services/update_product_cart.dart';

part 'update_product_cart_state.dart';

class UpdateProductCartCubit extends Cubit<UpdateProductCartState> {
  UpdateProductCartCubit() : super(UpdateProductCartInitial());

  Future<void> updateProductCart(
      {required String productCartId, required int quantity}) async {
    emit(UpdateProductCartLoading());
    Either<ServerFailure, UpdateProductInCart> result =
        await UpdateProductCart().updateProductCartService(
            productCartId: productCartId, quantity: quantity);
    result.fold(
      (error) => emit(
        UpdateProductCartError(
          errorMessage: error.toString(),
        ),
      ),
      (updateProductFromCart) => emit(
        UpdateProductCartSuccess(
          updateProductInCart: updateProductFromCart,
        ),
      ),
    );
  }
}
