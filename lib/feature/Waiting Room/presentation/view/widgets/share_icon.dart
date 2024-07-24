import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.ios_share,
      size: 18.sp,
      color: AppColors.kBlack,
    );
  }
}
