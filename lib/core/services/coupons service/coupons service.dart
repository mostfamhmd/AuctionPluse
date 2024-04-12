// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/Coupon%20Models/all_coupons_model.dart';
import 'package:smart_auction/core/models/Coupon%20Models/specific_coupon_model.dart';
import 'package:smart_auction/core/utils/consts.dart';

class CouponsService {
  DioHelper dioHelper = DioHelper();
  Future<Either<ServerFailure, AllCouponsModel>> getAllCoupons() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "coupons",
        token: token,
      );
      AllCouponsModel allCouponsModel = AllCouponsModel.fromJson(data);
      return right(allCouponsModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }

  Future<Either<ServerFailure, AllCouponsModel>> getSpecificCoupons({
    required String couponName,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "coupons/?name=$couponName",
        token: token,
      );
      AllCouponsModel allCouponsModel = AllCouponsModel.fromJson(data);
      return right(allCouponsModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }

  Future<Either<ServerFailure, SpecificCouponModel>> addNewCoupon({
    required String name,
    required String exiperyDate,
    required num discount,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        endPoint: "coupons",
        body: {
          "name": name,
          "expire": exiperyDate,
          "discount": discount,
        },
        token: token,
      );

      SpecificCouponModel specificCouponModel =
          SpecificCouponModel.fromJson(data);
      return right(specificCouponModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }

  Future<Either<ServerFailure, SpecificCouponModel>> updateCoupon({
    required String name,
    required String exiperyDate,
    required num discount,
    required String couponId,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.putRequest(
        endPoint: "coupons/$couponId",
        body: {
          "name": name,
          "expire": exiperyDate,
          "discount": discount,
        },
        token: token,
      );
      SpecificCouponModel specificCouponModel =
          SpecificCouponModel.fromJson(data);
      return right(specificCouponModel);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }

  Future<Either<ServerFailure, String>> deleteCoupon({
    required String couponId,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String removed = 'Removed successfully';
    try {
      await dioHelper.deleteRequest(
        endPoint: "coupons/$couponId",
        token: token,
      );
      return right(removed);
    } on DioException catch (dioException) {
      return left(
        ServerFailure.fromDioException(dioException: dioException),
      );
    } catch (error) {
      return left(ServerFailure(
        errMessage: error.toString(),
      ));
    }
  }
}
