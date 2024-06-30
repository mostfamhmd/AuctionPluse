import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/get_user_service.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/card_data_room_container.dart';

class UpcomingCardsListView extends StatelessWidget {
  const UpcomingCardsListView({
    super.key,
    required this.rooms,
  });
  final List<Room> rooms;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        final Stream getUserData =
            GetUserService().getUser(userID: rooms[index].ownerId!.id!);
        return StreamBuilder(
          stream: getUserData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerLoading();
            } else if (snapshot.hasData) {
              try {
                return CardDataRoomContainer(
                  room: rooms[index],
                  hostsID: rooms[index].hostIds!,
                  name: snapshot.data!.data!.name!,
                  titleRoom: rooms[index].title!,
                  timeStartingRoom: DateFormat('yyyy-MM-dd      HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          rooms[index].eventDate!)),
                  usersWaitingForRoom: rooms[index].userIds!,
                );
              } on DioException catch (e) {
                ServerFailure serverFailure =
                    ServerFailure.fromDioException(dioException: e);
                return FailureState(error: serverFailure.errMessage);
              } catch (e) {
                ServerFailure serverFailure =
                    ServerFailure(errMessage: e.toString());
                return FailureState(error: serverFailure.errMessage);
              }
            } else {
              if (snapshot.error is DioException) {
                ServerFailure serverFailure = ServerFailure.fromDioException(
                    dioException: snapshot.error as DioException);
                return FailureState(error: serverFailure.errMessage);
              } else {
                ServerFailure serverFailure =
                    ServerFailure(errMessage: snapshot.error.toString());
                return FailureState(error: serverFailure.errMessage);
              }
            }
          },
        );
      },
    );
  }
}
