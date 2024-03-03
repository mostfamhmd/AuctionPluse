import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/styles.dart';

class TitleNameAndTextField extends StatelessWidget {
  const TitleNameAndTextField({super.key, required this.title, this.maxLines});

  final String title;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.kPoppins400.copyWith(
              color: Colors.black,
              fontFamily: AppFonts.kPoppins400,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextField(
            style: AppStyles.kPoppins400.copyWith(
              fontFamily: AppFonts.kPoppins400,
              fontSize: 13.sp,
              color: AppColors.kGray,
            ),
            cursorColor: AppColors.kGray,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: outlineInputBorder(maxLines),
              enabledBorder: outlineInputBorder(maxLines),
              focusedBorder: outlineInputBorder(maxLines),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(int? maxLines) {
    return OutlineInputBorder(
      borderRadius: maxLines == null
          ? BorderRadius.circular(25.r)
          : BorderRadius.circular(5.r),
      borderSide: BorderSide(
        color: AppColors.kGray.withOpacity(0.8),
        width: 1.w,
      ),
    );
  }
}
