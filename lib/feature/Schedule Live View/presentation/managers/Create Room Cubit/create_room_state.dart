part of 'create_room_cubit.dart';

sealed class CreateRoomState {}

final class CreateRoomInitial extends CreateRoomState {}

final class CreateRoomLoading extends CreateRoomState {}

final class CreateRoomSuccess extends CreateRoomState {
  final NewEventModel newEventModel;

  CreateRoomSuccess({required this.newEventModel});
}

final class CreateRoomError extends CreateRoomState {
  final String error;

  CreateRoomError({required this.error});
}
