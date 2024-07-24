import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'AuctionPlus',
      style: TextStyle(
        fontFamily: AppFonts.kInter700,
        fontSize: 30.sp,
      ),
    );
  }
}
