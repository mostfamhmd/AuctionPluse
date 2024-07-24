import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'channel_selection_text.dart';

class SelectChannel extends StatelessWidget {
  const SelectChannel({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChannelSelectionText(),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20.sp,
            color: AppColors.kGray,
          ),
        ),
      ],
    );
  }
}
