import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'follow_text.dart';

class FollowBTN extends StatelessWidget {
  const FollowBTN({
    super.key,
    required this.onFollowTap,
  });
  final void Function() onFollowTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onFollowTap,
      child: Container(
        height: 30.h,
        width: 80.w,
        decoration: BoxDecoration(
          color: AppColors.kLightBlue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: const Center(
          child: FollowText(),
        ),
      ),
    );
  }
}
