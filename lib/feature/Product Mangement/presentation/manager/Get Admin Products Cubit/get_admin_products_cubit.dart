import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Product%20Mangement/data/services/get_specific_products_service.dart';

part 'get_admin_products_state.dart';

class GetAdminProductsCubit extends Cubit<GetAdminProductsState> {
  GetAdminProductsCubit() : super(GetAdminProductsInitial());

  Future<void> getAdminProducts() async {
    emit(GetAdminProductsLoading());
    Either<ServerFailure, ProductsModel> result =
        await GetAdminProductsService().getAdminProductsService();

    result.fold(
      (serverFailure) => emit(
        GetAdminProductsFailure(message: serverFailure.errMessage),
      ),
      (adminProducts) => emit(
        GetAdminProductsSuccess(productsModel: adminProducts),
      ),
    );
  }
}
