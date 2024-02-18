import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class MyCustomSuffixField extends StatelessWidget {
  const MyCustomSuffixField(
      {super.key,
      required this.myController,
      required this.textAlign,
      required this.hintText});
  final TextEditingController myController;
  final TextAlign textAlign;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      textAlign: textAlign,
      cursorColor: AppColors.kGray,
      decoration: InputDecoration(
        suffixIcon: SvgPicture.asset(
          AppIcons.kArrowMenu,
          fit: BoxFit.none,
        ),
        hintText: hintText,
        hintStyle: AppStyles.kPoppins400
            .copyWith(fontSize: 14.sp, color: AppColors.kGray),
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
