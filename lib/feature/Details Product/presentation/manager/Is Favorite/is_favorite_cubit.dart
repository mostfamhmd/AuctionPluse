import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/add_product_which_list_model.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/service/which_list_service.dart';

part 'is_favorite_state.dart';

class IsFavoriteCubit extends Cubit<IsFavoriteState> {
  IsFavoriteCubit() : super(IsFavoriteInitial());
  Future<void> addProduct({required String productId}) async {
    emit(IsFavoriteLoading());
    Either<ServerFailure, AddProductWhichList> result =
        await WhichListServices()
            .addProductToFavoriteService(productId: productId);
    result.fold(
      (serverFailure) => emit(
        IsFavoriteFailure(serverFailure: serverFailure.errMessage),
      ),
      (addProductWhichList) => emit(
        IsFavoriteSuccess(addProductWhichList: addProductWhichList),
      ),
    );
  }
}
