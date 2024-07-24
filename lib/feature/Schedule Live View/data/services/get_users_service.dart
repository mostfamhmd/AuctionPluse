import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';

class GetUsersService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, AllUsersModel>> getAllUsers() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> users = await dioHelper.getRequest(
        endPoint: "users",
        token: token,
      );
      AllUsersModel usersModel = AllUsersModel.fromJson(users);
      return right(usersModel);
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
