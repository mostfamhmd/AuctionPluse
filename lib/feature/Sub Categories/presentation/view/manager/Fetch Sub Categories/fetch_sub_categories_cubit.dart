import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/services/fetch_subCategories.dart';

part 'fetch_sub_categories_state.dart';

class FetchSubCategoriesCubit extends Cubit<FetchSubCategoriesState> {
  FetchSubCategoriesCubit() : super(FetchSubCategoriesLoading());
  Future<void> getSubCategories() async {
    emit(FetchSubCategoriesLoading());
    Either<ServerFailure, SubCategoriesModel> result =
        await FetchAllSubCategories().fetchAllSubCategories();
    result.fold(
      (serverFailure) {
        emit(
          FetchSubCategoriesFailed(
            error: serverFailure.errMessage,
          ),
        );
      },
      (subCategoriesModel) {
        emit(
          FetchSubCategoriesSuccess(subCategoriesModel: subCategoriesModel),
        );
      },
    );
  }
}
