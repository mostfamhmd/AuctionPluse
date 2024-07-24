import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';

class PayForOrder extends StatelessWidget {
  const PayForOrder({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(
          horizontal: 35.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.kLightBlue,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            const Spacer(
              flex: 2,
            ),
            SvgPicture.asset(
              AppIcons.kLock,
            ),
            const Spacer(),
            Text(
              "Pay for the order",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: AppFonts.kInter600,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
