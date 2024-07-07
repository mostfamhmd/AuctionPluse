// ignore_for_file: unused_field, unused_element

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/services/product%20services/product_services.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  Future<void> getAllProducts({
    bool? isAuction = false,
  }) async {
    emit(
      GetProductsLoading(),
    );
    Either<ServerFailure, ProductsModel> result =
        await ProductServices().getProduct(isAuction: isAuction);

    result.fold(
      (serverFailureMessage) => emit(
        GetProductsFailure(
          error: serverFailureMessage.errMessage,
        ),
      ),
      (productsModel) => emit(
        GetProductsSuccess(
          productsModel: productsModel,
        ),
      ),
    );
  }
}
