import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/services/event_services.dart';

part 'update_room_state.dart';

class UpdateRoomCubit extends Cubit<UpdateRoomState> {
  UpdateRoomCubit() : super(UpdateRoomInitial());

  Future updateRoom({
    required String roomId,
    String? address,
    List<AllUsers>? users,
    List<ProductInfo>? products,
    int? timeStamp,
    String? rtmtoken,
    bool? allowedChat,
    bool? event,
    String? idRaisedHand,
    List<Map<String, String>>? idSpeaker,
    List<String>? usersID,
  }) async {
    emit(UpdateRoomLoading());
    Either<ServerFailure, String> result = await EventServices().updateEvent(
      eventId: roomId,
      address: address,
      products: products,
      timeStamp: timeStamp,
      users: users,
      allowedChat: allowedChat,
      rtmtoken: rtmtoken,
      event: event,
      idRaisedHand: idRaisedHand,
      usersID: usersID,
      idSpeaker: idSpeaker,
    );
    result.fold(
      (serverFailure) => emit(
        UpdateRoomError(errorMessage: serverFailure.errMessage),
      ),
      (successMessage) => emit(
        UpdateRoomSuccess(successMessage: successMessage),
      ),
    );
  }
}
