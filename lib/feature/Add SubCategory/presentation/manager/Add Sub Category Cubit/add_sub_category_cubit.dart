import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Add%20SubCategory/data/model/add_sub_category_model.dart';
import 'package:smart_auction/feature/Add%20SubCategory/data/service/add_sub_category_services.dart';

part 'add_sub_category_state.dart';

class AddSubCategoryCubit extends Cubit<AddSubCategoryState> {
  AddSubCategoryCubit() : super(AddSubCategoryInitial());
  Future<void> addSubCategory(
      {required String subName, required String idCategory}) async {
    emit(AddSubCategoryLoading());
    Either<ServerFailure, AddSubCategoryModel> subCategory =
        await AddSubCategoryServices()
            .addSubCategory(subCategoryName: subName, idCategory: idCategory);
    subCategory.fold(
      (serverFailure) => emit(
        AddSubCategoryFailure(
          error: serverFailure.toString(),
        ),
      ),
      (subCategory) => emit(
        AddSubCategorySuccess(addSubCategoryModel: subCategory),
      ),
    );
  }
}
