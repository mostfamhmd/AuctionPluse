part of 'create_auction_cubit.dart';

sealed class CreateAuctionState {}

final class CreateAuctionInitial extends CreateAuctionState {}

final class CreateAuctionSuccess extends CreateAuctionState {
  final AuctionModel newAuctionModel;

  CreateAuctionSuccess({required this.newAuctionModel});
}

final class CreateAuctionLoading extends CreateAuctionState {}

final class CreateAuctionError extends CreateAuctionState {
  final String message;

  CreateAuctionError({required this.message});
}

sealed class UpdateAuctionState {}

final class UpdateAuctionInitial extends UpdateAuctionState {}

final class UpdateAuctionSuccess extends UpdateAuctionState {
  final AuctionModel updatedAuctionModel;

  UpdateAuctionSuccess({required this.updatedAuctionModel});
}

final class UpdateAuctionLoading extends UpdateAuctionState {}

final class UpdateAuctionError extends UpdateAuctionState {
  final String message;

  UpdateAuctionError({required this.message});
}
