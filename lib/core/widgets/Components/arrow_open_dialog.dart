import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowOpenDialog extends StatelessWidget {
  const ArrowOpenDialog({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_forward_ios,
        size: 14.sp,
      ),
    );
  }
}
