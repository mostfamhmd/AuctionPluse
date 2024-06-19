import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/new_event_model.dart';

class CreateNewEventService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, NewEventModel>> createNewEvent({
    required bool allowedChat,
    required String address,
    required List<AllUsers> users,
    required List<ProductInfo> products,
    required int timeStamp,
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
}
