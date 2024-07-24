// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';

class RatingComment extends StatefulWidget {
  const RatingComment({super.key});

  @override
  State<RatingComment> createState() => _RatingCommentState();
}

class _RatingCommentState extends State<RatingComment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingStars(
          value: context.read<AddCommentCubit>().ratings.toDouble(),
          onValueChanged: (v) {
            context.read<AddCommentCubit>().getRating(v);
            setState(() {});
          },
          starBuilder: (index, starColor) => SvgPicture.asset(
            AppIcons.kStar,
            colorFilter: ColorFilter.mode(
              starColor!,
              BlendMode.srcIn,
            ),
          ),
          starCount: 5,
          maxValue: 5.0,
          valueLabelVisibility: false,
          starOffColor: Colors.grey,
          starColor: const Color(0xFFFFC833),
        ),
        SizedBox(
          width: 25.w,
        ),
        Text(
          "${context.read<AddCommentCubit>().ratings} / 5.0",
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
