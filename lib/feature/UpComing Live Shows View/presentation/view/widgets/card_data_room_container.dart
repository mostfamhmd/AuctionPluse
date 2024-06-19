import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/live_show_view.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/user_id.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/live_show_b_t_ns.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/time_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/title_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/user_data_who_make_host.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/waiting_room.dart';

class CardDataRoomContainer extends StatelessWidget {
  const CardDataRoomContainer({
    super.key,
    required this.name,
    required this.titleRoom,
    required this.timeStartingRoom,
    required this.usersWaitingForRoom,
  });
  final String name;
  final String titleRoom;
  final String timeStartingRoom;
  final List<UserId> usersWaitingForRoom;
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
            name: name,
          ),
          SizedBox(height: 20.h),
          TitleLiveShow(
            titleLiveShow: titleRoom,
          ),
          SizedBox(height: 10.h),
          TimeLiveShow(
            timeLiveShow: timeStartingRoom,
          ),
          SizedBox(height: 10.h),
          // waiting room
          WaitingRoom(
            usersWaitingForRoom: usersWaitingForRoom,
          ),
          SizedBox(height: 20.h),
          LiveShowBTNs(
            onJoinedTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LiveShowView(),
                ),
              );
            },
            onLetKnowTap: () {},
            onInviteFriendsTap: () {},
          ),
        ],
      ),
    );
  }
}
