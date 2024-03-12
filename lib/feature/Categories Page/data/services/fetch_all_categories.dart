import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';

class FetchAllCategories {
  DioHelper dio = DioHelper();

  Future<Either<ServerFailure, CategoriesModel>> fetchAllCategories() async {
    CategoriesModel categoriesModel = CategoriesModel();
    try {
      Map<String, dynamic> data = await dio.getRequest(
        endPoint: "category",
        token: AppConsts.kToken,
      );
      categoriesModel = CategoriesModel.fromJson(data);
      return right(categoriesModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
