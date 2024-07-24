import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/removed_user_raised_hand_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/get_wanted_room_service.dart';

part 'remove_user_from_raised_hand_state.dart';

class RemoveUserFromRaisedHandCubit
    extends Cubit<RemoveUserFromRaisedHandState> {
  RemoveUserFromRaisedHandCubit() : super(RemoveUserFromRaisedHandInitial());

  Future removeUserFromRaisedHand({
    required String roomID,
    required List<String> raisedHandUserID,
  }) async {
    emit(RemoveUserFromRaisedHandLoading());
    Either<ServerFailure, RemoveUserRaisedHandModel> result =
        await GetWantedRoomService().removeUserFromRaiseHand(
            roomID: roomID, raisedHandUserID: raisedHandUserID);
    result.fold(
      (serverFailure) => emit(
        RemoveUserFromRaisedHandError(error: serverFailure.errMessage),
      ),
      (success) => emit(
        RemoveUserFromRaisedHandSuccess(updateddraisedHand: success),
      ),
    );
  }
}

class RemoveUserFromSpeakersCubit extends Cubit<RemoveUserFromSpeakersState> {
  RemoveUserFromSpeakersCubit() : super(RemoveUserFromSpeakersInitial());

  Future removeUserFromSpeakers({
    required String roomID,
    required List<String> speakersUserID,
  }) async {
    emit(RemoveUserFromSpeakersLoading());
    Either<ServerFailure, RemoveUserRaisedHandModel> result =
        await GetWantedRoomService().removeUserFromSpeakers(
            roomID: roomID, speakersUserID: speakersUserID);
    result.fold(
      (serverFailure) => emit(
        RemoveUserFromSpeakersError(error: serverFailure.errMessage),
      ),
      (success) => emit(
        RemoveUserFromSpeakersSuccess(updateddSpeakers: success),
      ),
    );
  }
}

class RemoveLiveCubit extends Cubit<RemoveLiveState> {
  RemoveLiveCubit() : super(RemoveLiveInitial());

  Future removeLive({
    required String roomID,
  }) async {
    emit(RemoveLiveLoading());
    Either<ServerFailure, RemoveUserRaisedHandModel> result =
        await GetWantedRoomService().removeLive(
      roomID: roomID,
    );
    result.fold(
      (serverFailure) => emit(
        RemoveLiveError(error: serverFailure.errMessage),
      ),
      (success) => emit(
        RemoveLiveSuccess(removedLive: success),
      ),
    );
  }
}

class RemoveUserFromLiveCubit extends Cubit<RemoveUserFromLiveState> {
  RemoveUserFromLiveCubit() : super(RemoveUserFromLiveInitial());

  Future removeUserFromLive({
    required String roomID,
    required List<String> usersRemove,
  }) async {
    emit(RemoveUserFromLiveLoading());
    Either<ServerFailure, RemoveUserRaisedHandModel> result =
        await GetWantedRoomService()
            .removeUserFromLive(roomID: roomID, usersRemove: usersRemove);
    result.fold(
      (serverFailure) => emit(
        RemoveUserFromLiveError(error: serverFailure.errMessage),
      ),
      (success) => emit(
        RemoveUserFromLiveSuccess(updateLiveAfterRemoveUser: success),
      ),
    );
  }
}
