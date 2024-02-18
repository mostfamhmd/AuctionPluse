import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class QuantityProduct extends StatelessWidget {
  const QuantityProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Quantity",
          style: AppStyles.kInter500.copyWith(
            fontSize: 16.sp,
            color: AppColors.kDarkBlue,
          ),
        ),
        const Spacer(
          flex: 6,
        ),
        SvgPicture.asset(AppIcons.kMinus),
        const Spacer(),
        Text(
          "1",
          style: AppStyles.kPoppins400.copyWith(
            fontSize: 18.sp,
            color: AppColors.kBlack,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(AppIcons.kPlus),
      ],
    );
  }
}
