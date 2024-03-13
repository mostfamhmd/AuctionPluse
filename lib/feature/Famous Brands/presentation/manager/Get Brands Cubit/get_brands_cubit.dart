import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/service/get_brands_service.dart';

part 'get_brands_state.dart';

class GetBrandsCubit extends Cubit<GetBrandsState> {
  GetBrandsCubit() : super(GetBrandsInitial());

  Future<void> getBrands() async {
    emit(
      GetBrandsLoading(),
    );
    Either<ServerFailure, GetBrandsModel> data =
        await GetBrandsService().getBrandsService();
    data.fold(
      (serverFailure) => emit(
        GetBrandsFailure(
          errorMessage: serverFailure.toString(),
        ),
      ),
      (getBrands) => emit(
        GetBrandsSuccess(getBrandsModel: getBrands),
      ),
    );
  }
}
