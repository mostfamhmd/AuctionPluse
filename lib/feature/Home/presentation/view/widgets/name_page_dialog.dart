// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';

class NamePageDialog extends StatelessWidget {
  const NamePageDialog({
    super.key,
    required this.namePage,
  });
  final String namePage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          namePage,
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: AppFonts.kInter500,
              color: AppColors.kGray),
        ),
        const Spacer(),
        RotatedBox(
            quarterTurns: 2, child: SvgPicture.asset(AppIcons.kArrowBack)),
      ],
    );
  }
}
