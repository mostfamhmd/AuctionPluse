import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.kGray,
        fontFamily: AppFonts.kPoppins400,
      ),
    );
  }
}
