import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/removed_user_raised_hand_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_room_model.dart';

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
  Stream<WantedEventModel> getWantedRoom22(
      {required String roomID, int? seconds}) async* {
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
        if (kDebugMode) {
          print("live data");
          print(response.data);
        }
        if (response.statusCode == 200) {
          WantedEventModel wantedRoom =
              WantedEventModel.fromJson(response.data);
          yield wantedRoom;
        }
      } catch (error) {
        throw error.toString();
      }
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  //WantedRoomModel? wantedRoomNull;
  Future<Either<ServerFailure, RemoveUserRaisedHandModel>>
      removeUserFromRaiseHand({
    required String roomID,
    required List<String> raisedHandUserID,
  }) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      Object data = {"users": raisedHandUserID};

      if (kDebugMode) {
        print(
            'Sending request to: ${AppConsts.kBaseurl}rooms/raisedhans/remove/$roomID');
      }
      //print('Request data: $data');
      //print('Request headers: $headers');

      final response = await _dio.put(
        "${AppConsts.kBaseurl}rooms/raisedhans/remove/$roomID",
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print('Response data: ${response.data}');
      }
      if (kDebugMode) {
        print("removed from raise hand list successfully");
      }

      RemoveUserRaisedHandModel updatedLiveAfterRemoveUserRaiseHand =
          RemoveUserRaisedHandModel.fromJson(response.data);
      return right(updatedLiveAfterRemoveUserRaiseHand);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDioException(dioException: dioError),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, RemoveUserRaisedHandModel>>
      removeUserFromSpeakers({
    required String roomID,
    required List<String> speakersUserID,
  }) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      Object data = {"users": speakersUserID};

      if (kDebugMode) {
        print(
            'Sending request to: ${AppConsts.kBaseurl}rooms/raisedhans/remove/$roomID');
      }
      //print('Request data: $data');
      //print('Request headers: $headers');

      final response = await _dio.put(
        "${AppConsts.kBaseurl}rooms/speaker/remove/$roomID",
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print('Response data: ${response.data}');
      }
      if (kDebugMode) {
        print("removed from raise hand list successfully");
      }

      RemoveUserRaisedHandModel updatedLiveAfterRemoveUserSpeaker =
          RemoveUserRaisedHandModel.fromJson(response.data);
      return right(updatedLiveAfterRemoveUserSpeaker);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDioException(dioException: dioError),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, RemoveUserRaisedHandModel>> removeLive({
    required String roomID,
  }) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};

      //print('Sending request to: ${AppConsts.kBaseurl}rooms/raisedhans/remove/$roomID');
      //print('Request data: $data');
      //print('Request headers: $headers');

      final response = await _dio.delete(
        "${AppConsts.kBaseurl}rooms/$roomID",
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print('Response data: ${response.data}');
      }
      if (kDebugMode) {
        print("removed from raise hand list successfully");
      }

      RemoveUserRaisedHandModel removedLive =
          RemoveUserRaisedHandModel.fromJson(response.data);
      return right(removedLive);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDioException(dioException: dioError),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }

  Future<Either<ServerFailure, RemoveUserRaisedHandModel>> removeUserFromLive(
      {required String roomID, required List<String> usersRemove}) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      Object data = {"users": usersRemove};

      // print(
      //     'Sending request to: ${AppConsts.kBaseurl}rooms/user/remove/$roomID');
      //print('Request data: $data');
      //print('Request headers: $headers');

      final response = await _dio.put(
        "${AppConsts.kBaseurl}rooms/user/remove/$roomID",
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print('Response data: ${response.data}');
      }
      if (kDebugMode) {
        print("removed from raise hand list successfully");
      }

      RemoveUserRaisedHandModel updatedLiveAfterRemoveUser =
          RemoveUserRaisedHandModel.fromJson(response.data);
      return right(updatedLiveAfterRemoveUser);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDioException(dioException: dioError),
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      return left(
        ServerFailure(
          errMessage: error.toString(),
        ),
      );
    }
  }
}
