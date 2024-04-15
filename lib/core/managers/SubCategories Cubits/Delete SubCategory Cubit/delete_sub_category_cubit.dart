import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20SubCategory%20Service/update_delete_subCategory_service.dart';

part 'delete_sub_category_state.dart';

class DeleteSubCategoryCubit extends Cubit<DeleteSubCategoryState> {
  DeleteSubCategoryCubit() : super(DeleteSubCategoryInitial());

  Future<void> deleteSubCategory({
    required String subCategoryId,
  }) async {
    emit(DeleteSubCategoryLoading());
    Either<ServerFailure, String> result =
        await UpdateDeleteSubCategoryService().deleteSubCategory(
      subCategoryId: subCategoryId,
    );

    result.fold(
      (serverFailure) => emit(
        DeleteSubCategoryError(
          error: serverFailure.errMessage,
        ),
      ),
      (deletedSubCategory) => emit(
        DeleteSubCategorySuccess(
          success: deletedSubCategory,
        ),
      ),
    );
  }
}
