import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class WaitingRoomText extends StatelessWidget {
  const WaitingRoomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Waiting room~ ',
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        fontSize: 14.sp,
      ),
    );
  }
}
