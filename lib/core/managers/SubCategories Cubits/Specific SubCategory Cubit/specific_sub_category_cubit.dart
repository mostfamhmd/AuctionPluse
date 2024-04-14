import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/specific%20subcategory%20model/specific_subcategory_model.dart';
import 'package:smart_auction/core/services/subcategory%20for%20specicific%20category/specicific_subcategory_service.dart';

part 'specific_sub_category_state.dart';

class SpecificSubCategoryCubit extends Cubit<SpecificSubCategoryState> {
  SpecificSubCategoryCubit() : super(SpecificSubCategoryInitial());

  Future<void> getSpecificSubCategory({required String id}) async {
    emit(
      SpecificSubCategoryLoading(),
    );
    Either<ServerFailure, SpecificSubCategoryModel> result =
        await SpecificSubCategoryService().getSpecificSubCategory(id: id);

    result.fold(
      (serverFailure) => emit(
        SpecificSubCategoryError(
          errMessage: serverFailure.errMessage,
        ),
      ),
      (subCategories) => emit(
        SpecificSubCategorySuccess(
          specificSubCategoryList: subCategories,
        ),
      ),
    );
  }
}
