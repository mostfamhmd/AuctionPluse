import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Live%20Show%20View/data/services/update_wanted_room.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/leave_b_t_n.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/show_product.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/show_waiting_users.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/waiting_message.dart';
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
        LeaveBTN(
          leave: isJoined ? "Leave" : "will join",
          onPressed: () {
            if (isJoined == true) {
              List<String> userIds = [];
              for (int i = 0; i < wantedRoom.userIds!.length; i++) {
                if (userID != wantedRoom.userIds![i].sId) {
                  userIds.add(wantedRoom.userIds![i].sId!);
                }
              }
              UpdateWantedRoomService().updateWantedRoom(
                roomID: wantedRoom.sId!,
                event: false,
                users: userIds,
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
      ],
    );
  }
}
