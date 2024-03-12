import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/data/services/fetch_all_categories.dart';

part 'fetch_categories_state.dart';

class FetchCategoriesCubit extends Cubit<FetchCategoriesState> {
  FetchCategoriesCubit() : super(FetchCategoriesLoading());
  List<Category> category = [];
  Future<void> getCategories() async {
    emit(FetchCategoriesLoading());
    Either<ServerFailure, CategoriesModel> result =
        await FetchAllCategories().fetchAllCategories();
    result.fold(
      (serverFailure) {
        emit(
          FetchCategoriesFailed(
            error: serverFailure.errMessage,
          ),
        );
      },
      (categoriesModel) {
        category = categoriesModel.data!;
        emit(
          FetchCategoriesSuccess(
            getCategories: categoriesModel,
          ),
        );
      },
    );
  }
}
