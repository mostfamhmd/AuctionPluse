import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Product%20Mangement/data/services/delete_specific_admin_product.dart';

part 'delete_specific_product_state.dart';

class DeleteSpecificProductCubit extends Cubit<DeleteSpecificProductState> {
  DeleteSpecificProductCubit() : super(DeleteSpecificProductInitial());

  Future<void> deleteSpecificProduct({
    required String productId,
  }) async {
    emit(DeleteSpecificProductLoading());
    Either<ServerFailure, String> result =
        await DeleteSpecificProduct().deleteSpecificProduct(
      productId: productId,
    );

    result.fold(
      (serverFailure) => emit(
        DeleteSpecificProductFailure(
          error: serverFailure.errMessage,
        ),
      ),
      (deletedCoupon) => emit(
        DeleteSpecificProductSuccess(
          success: deletedCoupon,
        ),
      ),
    );
  }
}
