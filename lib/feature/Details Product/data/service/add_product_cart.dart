import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/add_product_to_cart_model.dart';

class AddProductCartServices {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, AddedProductModel>> addProductCartService(
      {required String productId, required String color}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);

    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
          endPoint: "cart",
          body: {
            "productId": productId,
            "color": color,
          },
          token: token);
      AddedProductModel addedProductModel = AddedProductModel.fromJson(data);
      return right(addedProductModel);
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
