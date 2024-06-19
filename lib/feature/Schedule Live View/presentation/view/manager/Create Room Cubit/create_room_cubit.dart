import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/new_event_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/services/add_new_event_service.dart';

part 'create_room_state.dart';

class CreateRoomCubit extends Cubit<CreateRoomState> {
  CreateRoomCubit() : super(CreateRoomInitial());

  Future<void> createRoom({
    required bool allowedChat,
    required String address,
    required List<AllUsers> users,
    required List<ProductInfo> products,
    required int timeStamp,
  }) async {
    emit(CreateRoomLoading());
    Either<ServerFailure, NewEventModel> result =
        await CreateNewEventService().createNewEvent(
      allowedChat: allowedChat,
      address: address,
      products: products,
      timeStamp: timeStamp,
      users: users,
    );
    result.fold((failure) {
      emit(CreateRoomError(error: failure.errMessage));
    }, (success) {
      emit(CreateRoomSuccess(newEventModel: success));
    });
  }
}
