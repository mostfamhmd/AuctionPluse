import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/services/all_rooms_service.dart';

import 'upcoming_cards_list_view.dart';

class BodyUpComingLiveShows extends StatelessWidget {
  const BodyUpComingLiveShows({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream streamAllRooms = AllRoomsService().getRooms();

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: StreamBuilder(
        stream: streamAllRooms,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmerLoading();
          } else if (snapshot.hasData) {
            try {
              return CustomScrollView(
                slivers: [
                  UpcomingCardsListView(rooms: snapshot.data!),
                ],
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
          } else if (snapshot.hasError) {
            if (snapshot.error is DioException) {
              ServerFailure serverFailure = ServerFailure.fromDioException(
                  dioException: snapshot.error as DioException);
              return FailureState(error: serverFailure.errMessage);
            } else {
              ServerFailure serverFailure =
                  ServerFailure(errMessage: snapshot.error.toString());
              return FailureState(error: serverFailure.errMessage);
            }
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
