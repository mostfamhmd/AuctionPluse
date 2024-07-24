part of 'update_room_cubit.dart';

sealed class UpdateRoomState {}

final class UpdateRoomInitial extends UpdateRoomState {}

final class UpdateRoomLoading extends UpdateRoomState {}

final class UpdateRoomSuccess extends UpdateRoomState {
  final dynamic successMessage;

  UpdateRoomSuccess({required this.successMessage});
}

final class UpdateRoomError extends UpdateRoomState {
  final String errorMessage;

  UpdateRoomError({required this.errorMessage});
}
