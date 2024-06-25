import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_room_model.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/services/get_wanted_room_service.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/services/update_wanted_room.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/waiting_message.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class BodyHostState extends StatelessWidget {
  const BodyHostState(
      {super.key,
      required this.isBroad,
      required this.room,
      required this.userID});
  final bool isBroad;
  final Room room;
  final String userID;

  @override
  Widget build(BuildContext context) {
    Stream<WantedRoomModel> wantedRoomStream =
        GetWantedRoomService().getWantedRoom22(roomID: room.id!);
    return StreamBuilder(
      stream: wantedRoomStream,
      builder: (BuildContext context, AsyncSnapshot<WantedRoomModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingState();
        } else if (snapshot.hasData) {
          WantedRoomModel wantedRoom = snapshot.data!;
          if (wantedRoom.event == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AgoraLivePage(
                    isBroad: isBroad,
                    userID: userID,
                    agoraToken: wantedRoom.agoraToken ?? "",
                    rtmToken: wantedRoom.rtmToken ?? "",
                    title: wantedRoom.title!,
                  ),
                ),
              );
            });
            return const Center();
          } else {
            return Column(
              children: [
                waitingMessage(
                  isBroad: isBroad,
                  timeStartingLive:
                      "${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).year}/${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).month}/${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).day}   ${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).hour}:${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).minute}",
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: MySmallBTN(
                    onTap: () {
                      UpdateWantedRoomService()
                          .updateWantedRoom(roomID: room.id!, event: true);
                    },
                    nameButton: "Start Live",
                  ),
                ),
              ],
            );
          }
        } else {
          if (snapshot.error is DioException) {
            ServerFailure serverFailure = ServerFailure.fromDioException(
                dioException: snapshot.error as DioException);
            return FailureState(error: serverFailure.errMessage);
          } else {
            ServerFailure serverFailure = ServerFailure(
              errMessage: snapshot.error.toString(),
            );
            return FailureState(error: serverFailure.errMessage);
          }
        }
      },
    );
  }
}
