import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/add_product_to_cart_model.dart';
import 'package:smart_auction/feature/Details%20Product/data/service/add_product_cart.dart';

part 'add_product_to_cart_state.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartState> {
  AddProductToCartCubit() : super(AddProductToCartInitial());

  Future<void> addProductToCart(
      {required String productId, required String color}) async {
    emit(AddProductToCartLoading());
    Either<ServerFailure, AddedProductModel> result =
        await AddProductCartServices()
            .addProductCartService(productId: productId, color: color);
    result.fold(
      (serverFailure) => emit(
        AddProductToCartFailure(errMessage: serverFailure.errMessage),
      ),
      (addedSuccessfully) => emit(
        AddProductToCartSuccess(addedProductModel: addedSuccessfully),
      ),
    );
  }
}
