import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class WaitToStart extends StatelessWidget {
  const WaitToStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Wait for the host to start the show',
      style: TextStyle(
        fontFamily: AppFonts.kInter500,
        fontSize: 20.sp,
      ),
    );
  }
}
