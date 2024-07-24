// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/new_event_model.dart';

class EventServices {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, NewEventModel>> createNewEvent({
    required bool allowedChat,
    required String address,
    required List<AllUsers> users,
    required List<ProductInfo> products,
    required int timeStamp,
    required String evenToken,
    String? rtmtoken,
    bool? event,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String userId = await AppConsts.getData(AppConsts.kUserId);
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        endPoint: "rooms/newevent/$userId",
        body: {
          "hostIds": [userId],
          "allowchat": allowedChat,
          "eventDate": timeStamp,
          "title": address,
          "userIds": users.map((e) => e.sId).toList(),
          "productIds": products.map((e) => e.sId).toList(),
          "token": evenToken,
          if (rtmtoken != null) "RtmToken": rtmtoken,
          if (event != null) "event": event
        },
        token: token,
      );
      NewEventModel newEventModel = NewEventModel.fromJson(data);
      return right(newEventModel);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException: dioException));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, String>> updateEvent({
    bool? allowedChat,
    required String eventId,
    String? address,
    List<AllUsers>? users,
    List<String>? usersID,
    List<ProductInfo>? products,
    int? timeStamp,
    String? rtmtoken,
    bool? event,
    String? idRaisedHand,
    List<Map<String, String>>? idSpeaker,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.putRequest(
        endPoint: "rooms/$eventId",
        body: {
          if (timeStamp != null) "eventDate": timeStamp,
          if (allowedChat != null) "allowchat": allowedChat,
          if (rtmtoken != null) "eventDate": timeStamp.toString(),
          if (address != null) "title": address,
          if (users != null) "userIds": users.map((e) => e.sId).toList(),
          if (usersID != null) "userIds": usersID,
          if (products != null)
            "productIds": products.map((e) => e.sId).toList(),
          if (rtmtoken != null) "RtmToken": rtmtoken,
          if (event != null) "event": event,
          if (idRaisedHand != null) "raisedHands": {"_id": idRaisedHand},
          if (idSpeaker != null) "speakerIds": idSpeaker
        },
        token: token,
      );
      if (kDebugMode) {
        print("Successfully Updated");
      }
      return right("Successfully Updated");
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException: dioException));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
