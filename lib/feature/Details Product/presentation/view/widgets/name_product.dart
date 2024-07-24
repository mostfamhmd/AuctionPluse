// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/styles.dart';

class NameProduct extends StatelessWidget {
  const NameProduct({super.key, required this.productName});
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: AppStyles.kPoppins700.copyWith(
        fontSize: 16.sp,
        fontFamily: AppFonts.kPoppins700,
      ),
    );
  }
}
