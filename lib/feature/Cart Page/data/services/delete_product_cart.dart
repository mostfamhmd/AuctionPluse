import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/delete_product_cart_model.dart';

class DeleteProductCart {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, DeleteProductFromCart>> deleteProductCartService(
      {required String productCartId}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.deleteRequest(
        endPoint: "cart/$productCartId",
        token: token,
      );
      DeleteProductFromCart deleteProductFromCart =
          DeleteProductFromCart.fromJson(data);
      return right(deleteProductFromCart);
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
