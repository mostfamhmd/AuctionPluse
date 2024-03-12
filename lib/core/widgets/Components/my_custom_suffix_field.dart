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
      required this.hintText,
      this.isIcon = true,
      this.widget,
      this.onTap,
      this.isReadOnly});
  final TextEditingController myController;
  final TextAlign textAlign;
  final String hintText;
  final bool isIcon;
  final Widget? widget;
  final void Function()? onTap;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly ?? false,
      controller: myController,
      textAlign: textAlign,
      cursorColor: AppColors.kGray,
      decoration: InputDecoration(
        suffixIcon: isIcon == true
            ? InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  AppIcons.kArrowMenu,
                  fit: BoxFit.none,
                ),
              )
            : widget,
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
