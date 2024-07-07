// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/waiting_room_page.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/host_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/user_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/live_show_b_t_ns.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/time_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/title_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/user_data_who_make_host.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/waiting_room.dart';

class CardDataRoomContainer extends StatefulWidget {
  const CardDataRoomContainer({
    super.key,
    required this.name,
    required this.titleRoom,
    required this.timeStartingRoom,
    required this.usersWaitingForRoom,
    required this.hostsID,
    required this.room,
  });
  final String name;
  final String titleRoom;
  final String timeStartingRoom;
  final List<UserId> usersWaitingForRoom;
  final List<HostId> hostsID;
  final Room room;

  @override
  State<CardDataRoomContainer> createState() => _CardDataRoomContainerState();
}

class _CardDataRoomContainerState extends State<CardDataRoomContainer> {
  String? userID;
  bool? isBroad;
  getUserID() async {
    userID = await AppConsts.getData(AppConsts.kUserId);
  }

  @override
  void initState() {
    getUserID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.kGray.withOpacity(.4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // بيانات المستخدم اللي عامل المزاد
          UserDataWhoMakeHost(
            name: widget.name,
          ),
          SizedBox(height: 20.h),
          TitleLiveShow(
            titleLiveShow: widget.titleRoom,
          ),
          SizedBox(height: 10.h),
          TimeLiveShow(
            timeLiveShow: widget.timeStartingRoom,
          ),
          SizedBox(height: 10.h),
          // waiting room
          WaitingRoom(
            usersWaitingForRoom: widget.usersWaitingForRoom,
          ),
          SizedBox(height: 20.h),
          LiveShowBTNs(
            onJoinedTap: () async {
              isBroad = false;
              userID = await AppConsts.getData(AppConsts.kUserId);
              for (int i = 0; i < widget.hostsID.length; i++) {
                if (widget.hostsID[i].id == userID) {
                  isBroad = true;
                  break;
                }
              }
              if (userID != null) {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaitingRoomPage(
                      isBroad: isBroad!,
                      room: widget.room,
                      userID: userID!,
                    ),
                  ),
                );
              }
              setState(() {});
            },
            onLetKnowTap: () {},
            onInviteFriendsTap: () {
              Clipboard.setData(ClipboardData(
                      text: "${AppConsts.kBaseurl}${widget.room.id}"))
                  .then((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Copied to your clipboard !')));
              });
            },
          ),
        ],
      ),
    );
  }
}
