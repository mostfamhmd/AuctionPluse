import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/live_show_view.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/user_data_who_make_host.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/waiting_room.dart';

import 'live_show_b_t_ns.dart';
import 'time_live_show.dart';
import 'title_live_show.dart';

class BodyUpComingLiveShows extends StatelessWidget {
  const BodyUpComingLiveShows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
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
              const UserDataWhoMakeHost(
                name: 'Ahmed',
              ),
              SizedBox(height: 20.h),
              const TitleLiveShow(
                titleLiveShow: 'Hud Hud',
              ),
              SizedBox(height: 10.h),
              const TimeLiveShow(
                timeLiveShow: 'Tomorrow, 12:00 AM',
              ),
              SizedBox(height: 10.h),
              // waiting room
              const WaitingRoom(
                name: 'Ahmed',
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
        ),
      ),
    );
  }
}
