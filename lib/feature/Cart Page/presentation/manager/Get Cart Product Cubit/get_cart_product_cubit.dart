import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/data/services/get_products_cart.dart';

part 'get_cart_product_state.dart';

class GetCartProductCubit extends Cubit<GetCartProductState> {
  GetCartProductCubit() : super(GetCartProductInitial());

  Future<void> getCartProduct() async {
    emit(GetCartProductLoading());
    Either<ServerFailure, GetCartModel> result =
        await GetCartProductsService().getCartProductsService();

    result.fold(
      (failed) => emit(
        GetCartProductFailure(serverFailure: failed.errMessage),
      ),
      (myCart) => emit(
        GetCartProductSuccess(getCartModel: myCart),
      ),
    );
  }
}
