import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/agora_token_model.dart';

class GenerateAgoraTokenService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, AgoraRTMTokenModel>> generateAgoraToken({
    required String channelName,
  }) async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    try {
      Map<String, dynamic> data = await dioHelper.postRequest(
        endPoint: "rooms/agora/rooom/generatetoken",
        body: {
          "channel": channelName,
        },
        token: token,
      );
      AgoraRTMTokenModel generatedToken = AgoraRTMTokenModel.fromJson(data);
      return right(generatedToken);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException: dioException));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, AgoraRTMTokenModel>> generateRTMToken() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    String userID = await AppConsts.getData(AppConsts.kUserId);
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "rooms/agora/rooom/rtmtoken/$userID",
        token: token,
      );
      AgoraRTMTokenModel generatedToken = AgoraRTMTokenModel.fromJson(data);
      return right(generatedToken);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException: dioException));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
