import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/all_rooms_models.dart';

class AllRoomsService {
  DioHelper dioHelper = DioHelper();

  Stream<Either<ServerFailure, AllRoomsModel>> getRooms() async* {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      String userID = await AppConsts.getData(AppConsts.kUserId);
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "rooms/allrooms/paginated?",
        queryParameters: {
          "users": [userID],
        },
        token: token,
      );
      AllRoomsModel allRoomsModel = AllRoomsModel.fromJsonToDart(data);
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
