import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20And%20Delete%20Category%20Service/update_delete_category_service.dart';

part 'update_category_state.dart';

class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit() : super(UpdateCategoryInitial());

  Future<void> updateCategory({
    required String categoryId,
    required dynamic image,
    String? name,
  }) async {
    emit(UpdateCategoryLoading());
    Either<ServerFailure, String> result = await UpdateDeleteCategoryService()
        .updateCategory(categoryId: categoryId, name: name, image: image);

    result.fold(
      (serverFailure) => emit(
        UpdateCategoryError(
          error: serverFailure.errMessage,
        ),
      ),
      (updatedCategory) => emit(
        UpdateCategorySuccess(
          success: updatedCategory,
        ),
      ),
    );
  }
}
