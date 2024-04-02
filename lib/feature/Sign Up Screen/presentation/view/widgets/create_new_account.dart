import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class CreateNeAccount extends StatelessWidget {
  const CreateNeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Create a new account',
        style: TextStyle(
          fontFamily: AppFonts.kInter400,
          color: AppColors.kGray,
          fontSize: 12,
        ),
      ),
    );
  }
}
