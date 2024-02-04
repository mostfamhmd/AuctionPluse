import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/category_page.dart';

class CustomMore extends StatelessWidget {
  const CustomMore({super.key, required this.type, required this.typeMore, this.onTap});
  final String type;
  final String typeMore;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: AppStyles.kPoppins700.copyWith(fontSize: 14.sp),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            typeMore,
            style: AppStyles.kPoppins700.copyWith(
              fontSize: 14.sp,
              color: AppColors.kLightBlue,
            ),
          ),
        )
      ],
    );
  }
}
