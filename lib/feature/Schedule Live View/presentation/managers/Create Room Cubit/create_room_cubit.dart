import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/new_event_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/services/event_services.dart';

part 'create_room_state.dart';

class CreateRoomCubit extends Cubit<CreateRoomState> {
  CreateRoomCubit() : super(CreateRoomInitial());

  Future<void> createRoom({
    required bool allowedChat,
    required String address,
    required List<AllUsers> users,
    required List<ProductInfo> products,
    required int timeStamp,
    required String evenToken,
    String? rtmtoken,
    bool? event,
  }) async {
    emit(CreateRoomLoading());
    Either<ServerFailure, NewEventModel> result =
        await EventServices().createNewEvent(
      allowedChat: allowedChat,
      address: address,
      products: products,
      timeStamp: timeStamp,
      users: users,
      evenToken: evenToken,
      rtmtoken: rtmtoken,
      event: event,
    );
    result.fold((failure) {
      emit(CreateRoomError(error: failure.errMessage));
    }, (success) {
      emit(CreateRoomSuccess(newEventModel: success));
    });
  }
}
