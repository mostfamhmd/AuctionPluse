import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';

class FetchAllCategories {
  DioHelper dio = DioHelper();

  Future<dynamic> fetchAllCategories() async {
    CategoriesModel categoriesModel = CategoriesModel();
    try {
      Map<String, dynamic> data = await dio.getRequest(
        endPoint: "category",
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWU2NjcyYzQ4Mjc3ZjQxM2E5MDMyYzMiLCJpYXQiOjE3MDk3NDcxOTYsImV4cCI6MTcxNzUyMzE5Nn0.vo5-hc8-2KTJ4b1uzA6q8VKK9BBSbjavFu25dyKHBwM",
      );
      categoriesModel = CategoriesModel.fromJson(data);
      return categoriesModel;
    } catch (e) {
      return e.toString();
    }
  }
}
