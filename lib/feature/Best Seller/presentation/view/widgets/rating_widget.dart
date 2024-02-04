import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/icons.dart';

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
      starBuilder: (index, color) => SvgPicture.asset(
        AppIcons.kStar,
        color: color,
      ),
      starCount: 5,
      starSize: 15,
      maxValue: 5,
      starSpacing: 1,
      valueLabelVisibility: false,
      valueLabelMargin: EdgeInsets.zero,
      starOffColor: const Color(0xffe7e8ea),
      starColor: const Color(0xFFFFC833),
    );
  }
}
