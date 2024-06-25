import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class UpdateWantedRoomService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, Room>> updateWantedRoom(
      {required String roomID, bool? event}) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic> data = await dioHelper.putRequest(
        endPoint: "rooms/$roomID",
        body: {
          "event": event,
        },
        token: token,
      );
      Room wantedRoom = Room.fromJsonToRoom(data);
      return right(wantedRoom);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDioException(
          dioException: dioError,
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

  final Dio _dio = Dio();
  Room? wantedRoomNull;
  Stream<Room?> updateWantedRoom22(
      {required String roomID, bool? event}) async* {
    while (true) {
      try {
        String token = await AppConsts.getData(AppConsts.kUserToken);
        Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
        final response = await _dio.put(
          "${AppConsts.kBaseurl}rooms/$roomID",
          data: {
            "event": event,
          },
          options: Options(
            headers: headers,
          ),
        );
        if (response.statusCode == 200) {
          Room wantedRoom = Room.fromJsonToRoom(response.data);
          yield wantedRoom;
        }
        // final data = await dioHelper.getRequest(
        //   endPoint: "rooms/$roomID",
        //   token: token,
        // );
        //WantedRoomModel wantedRoom = WantedRoomModel.fromJsonToRoom(data);
      } catch (error) {
        yield wantedRoomNull;
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }
}
