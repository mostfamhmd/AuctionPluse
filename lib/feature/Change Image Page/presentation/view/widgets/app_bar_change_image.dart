import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

AppBar appBarChangeImage(BuildContext context, void Function()? onPressed) {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        AppIcons.kArrowBack,
        fit: BoxFit.none,
      ),
    ),
    title: Text(
      'Change image',
      style: AppStyles.kPoppins700.copyWith(fontSize: 16.sp),
    ),
    centerTitle: true,
    actions: [
      TextButton(
        onPressed: onPressed,
        child: Text(
          'Save',
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: AppFonts.kInter500,
          ),
        ),
      ),
    ],
  );
}
