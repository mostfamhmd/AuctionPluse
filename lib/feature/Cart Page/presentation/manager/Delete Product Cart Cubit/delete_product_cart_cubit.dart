import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/delete_product_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/data/services/delete_product_cart.dart';

part 'delete_product_cart_state.dart';

class DeleteProductCartCubit extends Cubit<DeleteProductCartState> {
  DeleteProductCartCubit() : super(DeleteProductCartInitial());

  Future<void> deleteProductCart({required String productCartId}) async {
    emit(DeleteProductCartLoading());
    Either<ServerFailure, DeleteProductFromCart> result =
        await DeleteProductCart()
            .deleteProductCartService(productCartId: productCartId);

    result.fold(
      (error) => emit(
        DeleteProductCartError(
          errorMessage: error.toString(),
        ),
      ),
      (deleteProductFromCart) => emit(
        DeleteProductCartSuccess(
          deleteProductFromCart: deleteProductFromCart,
        ),
      ),
    );
  }
}
