import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/update_product_cart.dart';

class UpdateProductCart {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, UpdateProductInCart>> updateProductCartService(
      {required String productCartId, required int quantity}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.putRequest(
        endPoint: "cart/$productCartId",
        body: {
          "quantity": quantity,
        },
        token: token,
      );
      UpdateProductInCart updateProductInCart =
          UpdateProductInCart.fromJson(data);
      return right(updateProductInCart);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (exception) {
      return left(
        ServerFailure(
          errMessage: exception.toString(),
        ),
      );
    }
  }
}
