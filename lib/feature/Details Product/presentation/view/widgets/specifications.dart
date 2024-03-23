import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class Specification extends StatelessWidget {
  const Specification({super.key, required this.specification});
  final String specification;
  @override
  Widget build(BuildContext context) {
    return Text(
      specification,
      style: TextStyle(
        fontFamily: AppFonts.kPoppins400,
        fontSize: 14.sp,
        color: AppColors.kGray,
      ),
    );
  }
}
