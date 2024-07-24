import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'raw_let_know_notification.dart';

class LetMeKnowBTN extends StatelessWidget {
  const LetMeKnowBTN({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.kGray,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: const RawLetKnowNotification(),
      ),
    );
  }
}
