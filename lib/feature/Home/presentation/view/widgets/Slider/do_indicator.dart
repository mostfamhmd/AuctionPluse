import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class DoIndicator extends StatelessWidget {
  const DoIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // Indicator Shape
    return AnimatedContainer(
      height: 10.h,
      duration: const Duration(milliseconds: 300),
      width: 10.w,
      decoration: BoxDecoration(
          color: isActive ? AppColors.kBlue : AppColors.kGray,
          shape: BoxShape.circle),
    );
  }
}
