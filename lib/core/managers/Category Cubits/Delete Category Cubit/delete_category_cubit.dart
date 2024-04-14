import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20Category%20Service/update_delete_category_service.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit() : super(DeleteCategoryInitial());

  Future<void> deleteCategory({
    required String categoryId,
  }) async {
    emit(DeleteCategoryLoading());
    Either<ServerFailure, String> result = await UpdateDeleteCategoryService()
        .deleteCategory(categoryId: categoryId);

    result.fold(
      (serverFailure) => emit(
        DeleteCategoryError(
          error: serverFailure.errMessage,
        ),
      ),
      (deletedCategory) => emit(
        DeleteCategorySuccess(
          success: deletedCategory,
        ),
      ),
    );
  }
}
