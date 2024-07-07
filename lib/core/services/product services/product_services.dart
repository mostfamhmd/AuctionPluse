import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/consts.dart';

class ProductServices {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, ProductsModel>> getProduct(
      {String? limit, String? sort, bool? isAuction = false}) async {
    ProductsModel productsModel = ProductsModel();
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String userID = await AppConsts.getData(AppConsts.kUserId);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
          endPoint: "products",
          queryParameters: {
            "limit": limit,
            "sort": sort,
            if (isAuction == true) "ownerId": userID
          },
          token: token);
      productsModel = ProductsModel.fromJson(data);
      return right(productsModel);
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
