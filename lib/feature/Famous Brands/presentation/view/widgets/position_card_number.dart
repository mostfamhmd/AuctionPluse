import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class PositionCardRank extends StatelessWidget {
  const PositionCardRank({
    super.key,
    required this.color,
    required this.rankNum,
    required this.top,
  });

  final int color;
  final int rankNum;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: top.h,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Color(color),
          boxShadow: [
            BoxShadow(
              color: Color(color),
              blurRadius: 6.r,
              offset: const Offset(-4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "RANK",
              style: AppStyles.kPoppins700
                  .copyWith(color: Colors.white, fontSize: 12.sp),
            ),
            Text(
              "$rankNum",
              style: AppStyles.kPoppins700
                  .copyWith(color: Colors.white, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
