import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/all_rooms_models.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/all_rooms_service.dart';

import 'upcoming_cards_list_view.dart';

class BodyUpComingLiveShows extends StatelessWidget {
  const BodyUpComingLiveShows({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<Either<ServerFailure, AllRoomsModel>> streamAllRooms =
        AllRoomsService().getRooms();

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: StreamBuilder<Either<ServerFailure, AllRoomsModel>>(
        stream: streamAllRooms,
        builder: (BuildContext context,
            AsyncSnapshot<Either<ServerFailure, AllRoomsModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingState();
          } else if (snapshot.hasData) {
            return snapshot.data!.fold(
              (failure) => FailureState(error: failure.errMessage),
              (rooms) => CustomScrollView(
                slivers: [
                  UpcomingCardsListView(
                    rooms: rooms,
                  ),
                ],
              ),
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
