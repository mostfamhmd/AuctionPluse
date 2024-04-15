import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

List<BoxShadow> middleBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.9),
    blurStyle: BlurStyle.normal,
    offset: const Offset(2, 4),
  ),
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.9),
    blurStyle: BlurStyle.normal,
    offset: const Offset(-2, -4),
  ),
];
List<BoxShadow> firstBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(8, 0),
  ),
];
List<BoxShadow> latestBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(-8, 0),
  ),
];
