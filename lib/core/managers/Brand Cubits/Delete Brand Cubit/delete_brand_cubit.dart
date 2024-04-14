import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20Brand%20Service/update_delete_brand_service.dart';

part 'delete_brand_state.dart';

class DeleteBrandCubit extends Cubit<DeleteBrandState> {
  DeleteBrandCubit() : super(DeleteBrandInitial());

  Future<void> deleteBrand({
    required String brandId,
  }) async {
    emit(DeleteBrandLoading());
    Either<ServerFailure, String> result =
        await UpdateDeleteBrandService().deleteBrand(brandId: brandId);

    result.fold(
      (serverFailure) => emit(
        DeleteBrandError(
          error: serverFailure.errMessage,
        ),
      ),
      (updatedBrand) => emit(
        DeleteBrandSuccess(
          success: updatedBrand,
        ),
      ),
    );
  }
}
