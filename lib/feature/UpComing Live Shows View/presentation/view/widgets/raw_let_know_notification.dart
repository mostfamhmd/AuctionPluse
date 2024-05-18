import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'let_know_text.dart';

class RawLetKnowNotification extends StatelessWidget {
  const RawLetKnowNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_none_sharp,
          color: AppColors.kBlack,
          size: 16.sp,
        ),
        SizedBox(
          width: 5.w,
        ),
        const LetKnowText(),
      ],
    );
  }
}
