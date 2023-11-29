import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class RatingBestSeller extends StatelessWidget {
  const RatingBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "4.5",
          style: AppStyles.kInter400
              .copyWith(fontSize: 10.sp, color: AppColors.kBlack),
        ),
        SizedBox(
          width: 5.w,
        ),
        SvgPicture.asset(AppIcons.kStar),
      ],
    );
  }
}
