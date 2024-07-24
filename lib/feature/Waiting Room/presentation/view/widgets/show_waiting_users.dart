import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/update_wanted_room.dart';

class ShowWaitingUsers extends StatelessWidget {
  const ShowWaitingUsers({
    super.key,
    required this.wantedRoom,
  });

  final WantedEventModel wantedRoom;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      children: List.generate(
          wantedRoom.userIds!.length,
          (index) => IntrinsicWidth(
                child: MySmallBTN(
                    onTap: () {
                      List<String> userIds = [];
                      for (int i = 0; i < wantedRoom.userIds!.length; i++) {
                        if (wantedRoom.userIds![index].sId !=
                            wantedRoom.userIds![i].sId) {
                          userIds.add(wantedRoom.userIds![i].sId!);
                        }
                      }
                      UpdateWantedRoomService().updateWantedRoom(
                        roomID: wantedRoom.sId!,
                        event: true,
                        users: userIds,
                      );
                    },
                    nameButton: wantedRoom.userIds![index].name!),
              )),
    );
  }
}
