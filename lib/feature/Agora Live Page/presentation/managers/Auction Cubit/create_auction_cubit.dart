import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/auction_model.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/services/auction_service.dart';

part 'create_auction_state.dart';

class CreateAuctionCubit extends Cubit<CreateAuctionState> {
  CreateAuctionCubit() : super(CreateAuctionInitial());

  Future createAuction(
      {required String roomID,
      required String productID,
      required String basePrice,
      required int duration}) async {
    emit(CreateAuctionLoading());
    Either<ServerFailure, AuctionModel> result = await AuctionService()
        .createAuction(
            roomID: roomID,
            productID: productID,
            basePrice: basePrice,
            duration: duration);

    result.fold(
        (errMessage) =>
            emit(CreateAuctionError(message: errMessage.errMessage)),
        (newAuction) =>
            emit(CreateAuctionSuccess(newAuctionModel: newAuction)));
  }
}

class UpdateAuctionCubit extends Cubit<UpdateAuctionState> {
  UpdateAuctionCubit() : super(UpdateAuctionInitial());

  Future updateAuction(
      {required String auctionID,
      int? increaseBidBy,
      String? basePrice,
      String? userID,
      bool? ended,
      bool? started,
      int? duration,
      int? highestBid}) async {
    emit(UpdateAuctionLoading());
    Either<ServerFailure, AuctionModel> result = await AuctionService()
        .updateAuction(
            auctionID: auctionID,
            increaseBidBy: increaseBidBy,
            userID: userID,
            ended: ended,
            started: started,
            basePrice: basePrice,
            duration: duration,
            highestBid: highestBid);

    result.fold(
        (errMessage) =>
            emit(UpdateAuctionError(message: errMessage.errMessage)),
        (newAuction) =>
            emit(UpdateAuctionSuccess(updatedAuctionModel: newAuction)));
  }
}
