import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class PlusMinusBTN extends StatelessWidget {
  const PlusMinusBTN({
    super.key,
    required this.btnName,
  });
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return Text(
      btnName,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.sp,
        fontFamily: AppFonts.kPoppins500,
      ),
    );
  }
}
