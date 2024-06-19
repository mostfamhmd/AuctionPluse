import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/user_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/user_data_model/user_data_model.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/get_user_service.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/name_host.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/waiting_room_text.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({
    super.key,
    required this.usersWaitingForRoom,
  });
  final List<UserId> usersWaitingForRoom;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WaitingRoomText(),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: List.generate(usersWaitingForRoom.length, (index) {
            final Stream<Either<ServerFailure, UserDataModel>> getUserData =
                GetUserService()
                    .getUser(userID: usersWaitingForRoom[index].id!);
            return StreamBuilder<Either<ServerFailure, UserDataModel>>(
              stream: getUserData,
              builder: (BuildContext context,
                  AsyncSnapshot<Either<ServerFailure, UserDataModel>>
                      snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.fold(
                    (failure) => FailureState(error: failure.errMessage),
                    (userData) => NameHost(
                      name: index == usersWaitingForRoom.length - 1
                          ? userData.data!.name!
                          : "${userData.data!.name!}, ",
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const FailureState(error: "Loading ...");
                } else {
                  return const FailureState(error: "Empty");
                }
              },
            );
          }),
        )
      ],
    );
  }
}
