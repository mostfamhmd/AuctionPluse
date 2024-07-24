import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Add%20SubCategory/data/model/add_sub_category_model.dart';

class AddSubCategoryServices {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, AddSubCategoryModel>> addSubCategory(
      {required String subCategoryName, required String idCategory}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    Map<String, dynamic> body = {
      "name": subCategoryName,
      "category": idCategory,
    };
    try {
      var response = await dioHelper.postRequest(
          body: body, endPoint: "subcategory", token: token);
      AddSubCategoryModel addSubCategoryModel =
          AddSubCategoryModel.fromJson(response);
      return right(addSubCategoryModel);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(dioException: e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
