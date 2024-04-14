import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20SubCategory%20Service/update_delete_subCategory_service.dart';

part 'update_sub_category_state.dart';

class UpdateSubCategoryCubit extends Cubit<UpdateSubCategoryState> {
  UpdateSubCategoryCubit() : super(UpdateSubCategoryInitial());

  Future<void> updateSubCategory({
    required String subCategoryId,
    String? name,
    String? categoryId,
  }) async {
    emit(UpdateSubCategoryLoading());
    Either<ServerFailure, String> result =
        await UpdateDeleteSubCategoryService().updateSubCategory(
            subCategoryId: subCategoryId, name: name, categoryId: categoryId);

    result.fold(
      (serverFailure) => emit(
        UpdateSubCategoryError(
          error: serverFailure.errMessage,
        ),
      ),
      (updatedSubCategory) => emit(
        UpdateSubCategorySuccess(
          success: updatedSubCategory,
        ),
      ),
    );
  }
}
