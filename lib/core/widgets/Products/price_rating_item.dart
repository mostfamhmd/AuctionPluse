import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class PriceRatingProduct extends StatelessWidget {
  const PriceRatingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r"$930.00",
          style: AppStyles.kInter700
              .copyWith(fontSize: 22.sp, color: AppColors.kLightBlue),
        ),
        const Spacer(
          flex: 50,
        ),
        SvgPicture.asset(AppIcons.kStar),
        const Spacer(),
        SvgPicture.asset(AppIcons.kStar),
        const Spacer(),
        SvgPicture.asset(AppIcons.kStar),
        const Spacer(),
        SvgPicture.asset(AppIcons.kStar),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.kStar,
          colorFilter: const ColorFilter.mode(AppColors.kGray, BlendMode.srcIn),
        ),
      ],
    );
  }
}
