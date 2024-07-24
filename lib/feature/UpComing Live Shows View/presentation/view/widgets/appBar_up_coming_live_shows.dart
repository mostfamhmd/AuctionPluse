// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/view/schedule_live_view.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/streaming_now_view.dart';

AppBar appBarUpComingLiveShows(BuildContext context, bool isUpcoming) {
  return AppBar(
    toolbarHeight: 80.h,
    elevation: 3,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 16.sp,
      ),
    ),
    title: CustomTitle(
      title: isUpcoming ? 'Upcoming live shows' : 'Live auction offers',
      fontSize: 16.sp,
    ),
    actions: [
      IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isUpcoming
                ? const ScheduleLiveView()
                : const StreamingNowView(),
          ),
        ),
        icon: SvgPicture.asset(
            isUpcoming ? AppIcons.kSchedule : AppIcons.kLiveAuction),
      ),
    ],
  );
}
