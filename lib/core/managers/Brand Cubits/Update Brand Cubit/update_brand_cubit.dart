import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20Brand%20Service/update_delete_brand_service.dart';

part 'update_brand_state.dart';

class UpdateBrandCubit extends Cubit<UpdateBrandState> {
  UpdateBrandCubit() : super(UpdateBrandInitial());

  Future<void> updateBrand({
    required String brandId,
    required dynamic image,
    String? name,
  }) async {
    emit(UpdateBrandLoading());
    Either<ServerFailure, String> result = await UpdateDeleteBrandService()
        .updateBrand(brandId: brandId, name: name, image: image);

    result.fold(
      (serverFailure) => emit(
        UpdateBrandError(
          error: serverFailure.errMessage,
        ),
      ),
      (updatedBrand) => emit(
        UpdateBrandSuccess(
          success: updatedBrand,
        ),
      ),
    );
  }
}
