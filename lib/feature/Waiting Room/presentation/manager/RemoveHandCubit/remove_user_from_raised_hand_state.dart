part of 'remove_user_from_raised_hand_cubit.dart';

sealed class RemoveUserFromRaisedHandState {}

final class RemoveUserFromRaisedHandInitial
    extends RemoveUserFromRaisedHandState {}

final class RemoveUserFromRaisedHandLoading
    extends RemoveUserFromRaisedHandState {}

final class RemoveUserFromRaisedHandSuccess
    extends RemoveUserFromRaisedHandState {
  final RemoveUserRaisedHandModel updateddraisedHand;

  RemoveUserFromRaisedHandSuccess({required this.updateddraisedHand});
}

final class RemoveUserFromRaisedHandError
    extends RemoveUserFromRaisedHandState {
  final String error;

  RemoveUserFromRaisedHandError({required this.error});
}

sealed class RemoveUserFromSpeakersState {}

final class RemoveUserFromSpeakersInitial extends RemoveUserFromSpeakersState {}

final class RemoveUserFromSpeakersLoading extends RemoveUserFromSpeakersState {}

final class RemoveUserFromSpeakersSuccess extends RemoveUserFromSpeakersState {
  final RemoveUserRaisedHandModel updateddSpeakers;

  RemoveUserFromSpeakersSuccess({required this.updateddSpeakers});
}

final class RemoveUserFromSpeakersError extends RemoveUserFromSpeakersState {
  final String error;

  RemoveUserFromSpeakersError({required this.error});
}

sealed class RemoveLiveState {}

final class RemoveLiveInitial extends RemoveLiveState {}

final class RemoveLiveLoading extends RemoveLiveState {}

final class RemoveLiveSuccess extends RemoveLiveState {
  final RemoveUserRaisedHandModel removedLive;

  RemoveLiveSuccess({required this.removedLive});
}

final class RemoveLiveError extends RemoveLiveState {
  final String error;

  RemoveLiveError({required this.error});
}

sealed class RemoveUserFromLiveState {}

final class RemoveUserFromLiveInitial extends RemoveUserFromLiveState {}

final class RemoveUserFromLiveLoading extends RemoveUserFromLiveState {}

final class RemoveUserFromLiveSuccess extends RemoveUserFromLiveState {
  final RemoveUserRaisedHandModel updateLiveAfterRemoveUser;

  RemoveUserFromLiveSuccess({required this.updateLiveAfterRemoveUser});
}

final class RemoveUserFromLiveError extends RemoveUserFromLiveState {
  final String error;

  RemoveUserFromLiveError({required this.error});
}
