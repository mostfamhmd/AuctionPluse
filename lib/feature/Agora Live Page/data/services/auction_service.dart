import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/auction_model.dart';

class AuctionService {
  final Dio _dio = Dio();
  //WantedRoomModel? wantedRoomNull;
  Future<Either<ServerFailure, AuctionModel>> createAuction(
      {required String roomID,
      required String productID,
      required String basePrice,
      required int duration}) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      Object body = {
        "product": productID,
        "tokshow": roomID,
        "baseprice": basePrice,
        "duration": duration,
        "started": true
      };
      final response = await _dio.post(
        "${AppConsts.kBaseurl}auctions",
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      AuctionModel newAuction = AuctionModel.fromJson(response.data);
      return right(newAuction);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioException(dioException: dioError));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, AuctionModel>> updateAuction({
    required String auctionID,
    int? increaseBidBy,
    String? basePrice,
    String? userID,
    bool? ended,
    bool? started,
    int? duration,
    int? highestBid,
  }) async {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      Object body = {
        "_id": auctionID,
        if (basePrice != null) "baseprice": basePrice,
        if (duration != null) "duration": duration,
        if (userID != null) "winner": userID,
        if (increaseBidBy != null) "increaseBidBy": increaseBidBy,
        if (started != null) "started": started,
        if (ended != null) "ended": ended,
        if (highestBid != null) "higestbid": highestBid
      };
      final response = await _dio.put(
        "${AppConsts.kBaseurl}auctions/$auctionID",
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      AuctionModel updatedAuction = AuctionModel.fromJson(response.data);
      return right(updatedAuction);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioException(dioException: dioError));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  Stream<AuctionModel> getAuctionByRoomID({
    required String roomID,
  }) async* {
    while (true) {
      try {
        String token = await AppConsts.getData(AppConsts.kUserToken);
        Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
        final response = await _dio.get(
          "${AppConsts.kBaseurl}auctions/$roomID",
          options: Options(
            headers: headers,
          ),
        );

        if (kDebugMode) {
          print(response.data);
          print("auction data");
        }
        if (response.statusCode == 200) {
          AuctionModel wantedAuction = AuctionModel.fromJson(response.data);
          yield wantedAuction;
        }
      } catch (error) {
        throw error.toString();
      }
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }
}
