import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/all_rooms_models.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/user_data_model/user_data_model.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/get_user_service.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/card_data_room_container.dart';

class UpcomingCardsListView extends StatelessWidget {
  const UpcomingCardsListView({
    super.key,
    required this.rooms,
  });
  final AllRoomsModel rooms;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: rooms.rooms!.length,
      itemBuilder: (context, index) {
        final Stream<Either<ServerFailure, UserDataModel>> getUserData =
            GetUserService().getUser(userID: rooms.rooms![index].ownerId!.id!);
        return StreamBuilder<Either<ServerFailure, UserDataModel>>(
          stream: getUserData,
          builder: (BuildContext context,
              AsyncSnapshot<Either<ServerFailure, UserDataModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerLoading();
            } else if (snapshot.hasData) {
              return snapshot.data!.fold(
                (failure) => FailureState(error: failure.errMessage),
                (userData) => CardDataRoomContainer(
                  name: userData.data!.name!,
                  titleRoom: rooms.rooms![index].title!,
                  timeStartingRoom: DateFormat('yyyy-MM-dd      HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          rooms.rooms![index].eventDate!)),
                  usersWaitingForRoom: rooms.rooms![index].userIds!,
                ),
              );
            } else {
              return const Text('No data available');
            }
          },
        );
      },
    );
  }
}
