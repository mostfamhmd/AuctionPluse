import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';

class RatingComment extends StatefulWidget {
  const RatingComment({super.key});

  @override
  State<RatingComment> createState() => _RatingCommentState();
}

class _RatingCommentState extends State<RatingComment> {
  double value = 0;
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingStars(
          value: value,
          onValueChanged: (v) {
            setState(() {
              value = v;
              val = v.toInt();
            });
          },
          starBuilder: (index, starColor) => SvgPicture.asset(
            AppIcons.kStar,
            colorFilter: ColorFilter.mode(
              starColor!,
              BlendMode.srcIn,
            ),
          ),
          starCount: 5,
          starSize: 25.sp,
          maxValue: 5,
          starSpacing: 15.w,
          valueLabelVisibility: false,
          starOffColor: Colors.grey,
          starColor: const Color(0xFFFFC833),
        ),
        SizedBox(
          width: 25.w,
        ),
        Text(
          "$val / 5",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: AppFonts.kPoppins700,
            color: AppColors.kGray,
          ),
        ),
      ],
    );
  }
}
