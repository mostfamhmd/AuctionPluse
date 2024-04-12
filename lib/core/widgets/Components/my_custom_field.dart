// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class MyCustomField extends StatelessWidget {
  MyCustomField({
    super.key,
    required this.myController,
    required this.textAlign,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
  });
  final TextEditingController myController;
  final TextAlign textAlign;
  final String hintText;
  int? maxLines;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: myController,
      textAlign: textAlign,
      cursorColor: AppColors.kGray,
      keyboardType: keyboardType,
      style:
          AppStyles.kPoppins400.copyWith(fontSize: 14.sp, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.kPoppins400
            .copyWith(fontSize: 14.sp, color: Colors.black),
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.kGray));
  }
}
