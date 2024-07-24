import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class EditOrDeleteBTN extends StatelessWidget {
  const EditOrDeleteBTN({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 25.sp,
        color: icon == Icons.delete ? AppColors.kRed : AppColors.kGray,
      ),
    );
  }
}
