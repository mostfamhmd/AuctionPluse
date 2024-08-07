import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class SaleSlider extends StatelessWidget {
  const SaleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Super Flash Sale\n 50% Off",
      maxLines: 2,
      style: AppStyles.kPoppins700.copyWith(
        fontSize: 24.sp,
        color: AppColors.kWhite,
      ),
    );
  }
}
