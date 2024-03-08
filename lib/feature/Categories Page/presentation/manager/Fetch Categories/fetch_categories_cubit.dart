import 'package:bloc/bloc.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/data/services/fetch_all_categories.dart';

part 'fetch_categories_state.dart';

class FetchCategoriesCubit extends Cubit<FetchCategoriesState> {
  FetchCategoriesCubit() : super(FetchCategoriesLoading());
  Future<void> getCategories() async {
    emit(FetchCategoriesLoading());
    try {
      CategoriesModel result = await FetchAllCategories().fetchAllCategories();
      emit(
        FetchCategoriesSuccess(
          getCategories: result,
        ),
      );
    } catch (e) {
      emit(
        FetchCategoriesFailed(
          error: e.toString(),
        ),
      );
    }
  }
}
