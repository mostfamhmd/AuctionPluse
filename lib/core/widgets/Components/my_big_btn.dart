import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class MyBigBTN extends StatelessWidget {
  const MyBigBTN({super.key, this.onTap, required this.nameBTN});

  final void Function()? onTap;
  final String nameBTN;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.kLightBlue,
        child: Center(
          child: Text(
            nameBTN,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: AppFonts.kPoppins700,
            ),
          ),
        ),
      ),
    );
  }
}
