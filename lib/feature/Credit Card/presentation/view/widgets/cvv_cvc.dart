import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';

class CvvCvc extends StatelessWidget {
  const CvvCvc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "CVV/CVC",
              style: TextStyle(
                fontFamily: AppFonts.kInter600,
                fontSize: 16.sp,
                color: const Color(0xFF3A3C3F),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset(
              AppIcons.kHint,
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.r),
            border: Border(
              bottom: BorderSide(width: 4.w, color: AppColors.kLightBlue),
            ),
          ),
          child: TextFormField(
            style: TextStyle(
              fontFamily: AppFonts.kInter500,
              fontSize: 16.sp,
              color: const Color(0xFF424D59),
            ),
            keyboardType: TextInputType.number,
            cursorColor: AppColors.kGray,
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
            ],
            decoration: InputDecoration(
              border: buildBorder(),
              focusedBorder: buildBorder(),
              enabledBorder: buildBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
