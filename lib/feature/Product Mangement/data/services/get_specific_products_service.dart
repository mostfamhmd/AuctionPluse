import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/consts.dart';

class GetAdminProductsService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, ProductsModel>> getAdminProductsService() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "products",
        token: token,
      );
      ProductsModel productsModel = ProductsModel.fromJson(data);
      return right(
        productsModel,
      );
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
}
