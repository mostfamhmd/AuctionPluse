import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class TypeText extends StatelessWidget {
  const TypeText({super.key, required this.kTypeText});

  final String kTypeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      kTypeText,
      style: AppStyles.kPoppins700.copyWith(
        color: AppColors.kDarkBlue,
        fontSize: 14.sp,
      ),
    );
  }
}