import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/model/delete_product_which_list_model.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/service/which_list_service.dart';

part 'delete_favorite_product_state.dart';

class DeleteFavoriteProductCubit extends Cubit<DeleteFavoriteProductState> {
  DeleteFavoriteProductCubit() : super(DeleteFavoriteProductInitial());
  Future<void> deleteProductWhichList({required String productId}) async {
    emit(DeleteProdWhichListLoading());
    Either<ServerFailure, DeletedProductwhichListModel> result =
        await WhichListServices().deleteProductWichList(productId: productId);

    result.fold(
      (errorMessage) => emit(
        DeleteProductWhichListError(error: errorMessage.errMessage),
      ),
      (deletedProductwhichListModel) => emit(
        DeleteProductWhichListSuccess(
            deletedProductwhichListModel: deletedProductwhichListModel),
      ),
    );
  }
}
