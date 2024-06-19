import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/user_data_model/user_data_model.dart';

class GetUserService {
  DioHelper dioHelper = DioHelper();

  Stream<Either<ServerFailure, UserDataModel>> getUser(
      {required String userID}) async* {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "users/$userID",
        token: token,
      );
      UserDataModel allRoomsModel = UserDataModel.fromJsonToDart(data);
      yield right(allRoomsModel);
    } on DioException catch (dioError) {
      yield left(
        ServerFailure.fromDioException(
          dioException: dioError,
        ),
      );
    } catch (error) {
      yield left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }
}
