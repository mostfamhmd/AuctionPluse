import 'package:bloc/bloc.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/services/fetch_subCategories.dart';

part 'fetch_sub_categories_state.dart';

class FetchSubCategoriesCubit extends Cubit<FetchSubCategoriesState> {
  FetchSubCategoriesCubit() : super(FetchSubCategoriesLoading());
  Future<void> getSubCategories() async {
    emit(FetchSubCategoriesLoading());
    try {
      SubCategoriesModel subCategoriesModel =
          await FetchAllSubCategories().fetchAllSubCategories();
      emit(
        FetchSubCategoriesSuccess(subCategoriesModel: subCategoriesModel),
      );
    } catch (e) {
      emit(
        FetchSubCategoriesFailed(
          error: e.toString(),
        ),
      );
    }
  }
}
