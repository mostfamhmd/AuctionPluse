import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/Brand%20Models/specific_brand_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/service/get_brands_service.dart';

part 'get_specific_brand_state.dart';

class GetSpecificBrandCubit extends Cubit<GetSpecificBrandState> {
  GetSpecificBrandCubit() : super(GetSpecificBrandInitial());
  Future<void> getSpecificBrand({String? id}) async {
    emit(
      GetSpecificBrandLoading(),
    );
    Either<ServerFailure, SpecificBrandModel> data =
        await GetBrandsService().getSpecificBrandService(id: id);
    data.fold(
      (serverFailure) => emit(
        GetSpecificBrandError(
          error: serverFailure.errMessage,
        ),
      ),
      (getSpecificBrand) => emit(
        GetSpecificBrandSuccess(specificBrandModel: getSpecificBrand),
      ),
    );
  }
}
