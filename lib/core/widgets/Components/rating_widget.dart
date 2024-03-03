// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';

import '../../utils/icons.dart';

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key, required this.rating});

  late double rating;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: rating,
      onValueChanged: (v) {
        rating = v;
      },
      starBuilder: (index, starColor) => SvgPicture.asset(
        AppIcons.kStar,
        colorFilter: ColorFilter.mode(
          starColor!,
          BlendMode.srcIn,
        ),
      ),
      starCount: 5,
      starSize: 15,
      maxValue: 5,
      starSpacing: 1,
      valueLabelVisibility: false,
      valueLabelMargin: EdgeInsets.zero,
      starOffColor:AppColors.kGray,
      starColor: const Color(0xFFFFC833),
    );
  }
}
