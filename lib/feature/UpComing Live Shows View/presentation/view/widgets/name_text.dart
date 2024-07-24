import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class NameText extends StatelessWidget {
  const NameText({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: AppFonts.kPoppins500,
        fontSize: 16.sp,
      ),
    );
  }
}
