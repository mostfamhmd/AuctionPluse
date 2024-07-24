import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/update_wanted_room.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/leave_b_t_n.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/show_product.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/show_waiting_users.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/waiting_message.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class BodyUserState extends StatelessWidget {
  const BodyUserState({
    super.key,
    required this.isBroad,
    required this.wantedRoom,
    required this.room,
    required this.isJoined,
    required this.userID,
  });

  final bool isBroad;
  final WantedEventModel wantedRoom;
  final Room room;
  final bool isJoined;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        waitingMessage(
            isBroad: isBroad,
            timeStartingLive:
                '${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).year}/${DateTime.fromMillisecondsSinceEpoch(room.eventDate!).month}/${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).day}   ${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).hour}:${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).minute}'),
        SizedBox(
          height: 10.h,
        ),
        if (wantedRoom.userIds!.isNotEmpty)
          ShowWaitingUsers(wantedRoom: wantedRoom),
        SizedBox(
          height: 10.h,
        ),
        if (wantedRoom.productIds!.isNotEmpty)
          ShowProduct(wantedRoom: wantedRoom),
        BlocListener<UpdateRoomCubit, UpdateRoomState>(
          listener: (context, state) {
            if (state is UpdateRoomSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AgoraLivePage(
                    isBroad: isBroad,
                    userID: userID,
                    idRoom: wantedRoom.sId!,
                    agoraToken: wantedRoom.agoraToken ?? "",
                    rtmToken: wantedRoom.rtmToken ?? "",
                    title: wantedRoom.title!,
                  ),
                ),
              );
            }
            if (state is UpdateRoomError) {
              myErrorSnackBar(context, state.errorMessage);
            }
            if (state is UpdateRoomLoading) {
              myLoadingSnackBar(context, "Loading to update your room");
            }
          },
          child: LeaveBTN(
            leave: isJoined ? "Leave" : "will join",
            onPressed: () {
              if (isJoined == true) {
                List<String> userIds = [];
                for (int i = 0; i < wantedRoom.userIds!.length; i++) {
                  if (userID != wantedRoom.userIds![i].sId) {
                    userIds.add(wantedRoom.userIds![i].sId!);
                  }
                }
                context.read<UpdateRoomCubit>().updateRoom(
                      roomId: wantedRoom.sId!,
                      event: true,
                      usersID: userIds,
                    );
              } else {
                List<String> userIds = [];
                for (int i = 0; i < wantedRoom.userIds!.length; i++) {
                  userIds.add(wantedRoom.userIds![i].sId!);
                }
                userIds.add(userID);
                UpdateWantedRoomService().updateWantedRoom(
                  roomID: wantedRoom.sId!,
                  event: false,
                  users: userIds,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
