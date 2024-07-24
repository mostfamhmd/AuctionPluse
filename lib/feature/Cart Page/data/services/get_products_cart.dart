import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';

class GetCartProductsService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, GetCartModel>> getCartProductsService() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "cart",
        token: token,
      );
      GetCartModel getCartModel = GetCartModel.fromJson(data);
      return right(getCartModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(
          dioException: dioException,
        ),
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
