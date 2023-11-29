import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Order mangement",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Product mangement",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Add a brand",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Add a category",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Add a subcategory",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "Add a product",
          style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }
}
