import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/specific%20subcategory%20model/specific_subcategory_model.dart';
import 'package:smart_auction/core/utils/consts.dart';

class SpecificSubCategoryService {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, SpecificSubCategoryModel>>
      getSpecificSubCategory({required String id}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    SpecificSubCategoryModel specificSubCategoryModel =
        SpecificSubCategoryModel();
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
          endPoint: "category/$id/subcategories", token: token);
      specificSubCategoryModel = SpecificSubCategoryModel.fromJson(data);
      return right(specificSubCategoryModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(
          dioException: dioException,
        ),
      );
    } catch (error) {
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<SpecificSubCategoryModel> getSpecificSubCategories(
      {required String id}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    SpecificSubCategoryModel specificSubCategoryModel =
        SpecificSubCategoryModel();
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
          endPoint: "category/$id/subcategories", token: token);
      specificSubCategoryModel = SpecificSubCategoryModel.fromJson(data);
      return specificSubCategoryModel;
    } on DioException catch (dioException) {
      throw ServerFailure.fromDioException(
        dioException: dioException,
      );
    } catch (error) {
      throw left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }
}
