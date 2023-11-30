import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class NameProductAndQuantity extends StatelessWidget {
  const NameProductAndQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "MacBook Pro",
          style: AppStyles.kInter600.copyWith(
            fontSize: 20.sp,
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
        const Spacer(),
      ],
    );
  }
}
