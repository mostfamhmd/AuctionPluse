import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class EditRemove extends StatelessWidget {
  const EditRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "edit",
          style: AppStyles.kPoppins400
              .copyWith(fontSize: 20.sp, color: AppColors.kGray),
        ),
        SvgPicture.asset(AppIcons.kRemove),
      ],
    );
  }
}
