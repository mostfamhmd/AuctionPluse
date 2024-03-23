import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';

class CategriesItem extends StatelessWidget {
  const CategriesItem(
      {super.key,
      required this.categoryName,
      required this.categoryImage,
      required this.index,
      required this.length});
  final String categoryName;
  final String categoryImage;
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: index == 1
              ? EdgeInsets.only(left: 10.w)
              : index > 1 && index < length
                  ? EdgeInsets.only(left: 10.w, right: 10.w)
                  : EdgeInsets.only(right: 10.w),
          child: SizedBox(
            height: 120.h,
            width: 70.w,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  ImageComponent(
                      urlImage: categoryImage,
                      height: 70.h,
                      width: 65.w,
                      radius: 5.w),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    categoryName,
                    style: AppStyles.kPoppins500.copyWith(
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
