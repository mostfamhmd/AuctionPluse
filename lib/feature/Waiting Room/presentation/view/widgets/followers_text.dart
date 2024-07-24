import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class FollowersText extends StatelessWidget {
  const FollowersText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Followers',
      style: TextStyle(fontFamily: AppFonts.kInter600, fontSize: 16.sp),
    );
  }
}
