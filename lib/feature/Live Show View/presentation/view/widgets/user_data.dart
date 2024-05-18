import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'follow_b_t_n.dart';
import 'rate_text.dart';

Row userData(
  BuildContext context, {
  required num rate,
  required void Function() onFollowTap,
}) {
  return Row(
    children: [
      // rate value
      RateText(
        rate: rate,
      ),
      SizedBox(width: 15.w),
      // rate icon
      const Icon(
        Icons.star,
        color: AppColors.kOrange,
      ),
      SizedBox(width: 30.w),
      // follow button
      FollowBTN(
        onFollowTap: onFollowTap,
      ),
    ],
  );
}
