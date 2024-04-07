import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/add_product_which_list_model.dart';

class AddProductToFavoriteService {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, AddProductWhichList>>
      addProductToFavoriteService({required String productId}) async {
    AddProductWhichList addProductWhichList = AddProductWhichList();
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        body: {
          "productId": productId,
        },
        endPoint: "wishlist",
      );
      addProductWhichList = AddProductWhichList.fromJson(data);
      return right(addProductWhichList);
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
