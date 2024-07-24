import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/add_product_which_list_model.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/model/delete_product_which_list_model.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/model/which_list_model.dart';

class WhichListServices {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, WhichListModel>> whichListServices() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> response = await dioHelper.getRequest(
        endPoint: "wishlist",
        token: token,
      );
      WhichListModel whichListModel = WhichListModel.fromJson(response);
      return right(whichListModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  Future<Either<ServerFailure, DeletedProductwhichListModel>>
      deleteProductWichList({required String productId}) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> response = await dioHelper.deleteRequest(
        endPoint: "wishlist/$productId",
        token: token,
      );
      DeletedProductwhichListModel deletedProductwhichListModel =
          DeletedProductwhichListModel.fromJson(response);
      return right(deletedProductwhichListModel);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  Future<Either<ServerFailure, AddProductWhichList>>
      addProductToFavoriteService({required String productId}) async {
    AddProductWhichList addProductWhichList = AddProductWhichList();
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        body: {
          "productId": productId,
        },
        endPoint: "wishlist",
        token: token,
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
