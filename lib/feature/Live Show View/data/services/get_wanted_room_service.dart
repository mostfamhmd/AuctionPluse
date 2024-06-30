import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_room_model.dart';

class GetWantedRoomService {
  DioHelper dioHelper = DioHelper();

  Stream<Either<ServerFailure, WantedRoomModel>> getWantedRoom(
      {required String roomID}) async* {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "rooms/$roomID",
        token: token,
      );
      WantedRoomModel wantedRoom = WantedRoomModel.fromJsonToRoom(data);
      yield right(wantedRoom);
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

  final Dio _dio = Dio();
  //WantedRoomModel? wantedRoomNull;
  Stream<WantedEventModel> getWantedRoom22({required String roomID}) async* {
    while (true) {
      try {
        String token = await AppConsts.getData(AppConsts.kUserToken);
        Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
        final response = await _dio.get(
          "${AppConsts.kBaseurl}rooms/event/$roomID",
          options: Options(
            headers: headers,
          ),
        );
        if (response.statusCode == 200) {
          WantedEventModel wantedRoom =
              WantedEventModel.fromJson(response.data);
          yield wantedRoom;
        }
      } catch (error) {
        throw error.toString();
      }
      await Future.delayed(const Duration(seconds: 30));
    }
  }
}
