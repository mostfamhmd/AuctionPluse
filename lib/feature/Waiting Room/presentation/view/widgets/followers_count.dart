import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

import 'followers_text.dart';

Row followersCount({
  required int followers,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        followers.toString(),
        style: TextStyle(
          fontFamily: AppFonts.kInter600,
          fontSize: 32.sp,
        ),
      ),
      SizedBox(width: 10.w),
      const FollowersText()
    ],
  );
}
