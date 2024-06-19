import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

import 'button_sort_by.dart';

class BodySortPage extends StatelessWidget {
  const BodySortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Match",
            style: AppStyles.kPoppins700
                .copyWith(fontSize: 14.sp, color: AppColors.kLightBlue),
          ),
          SizedBox(
            height: 30.h,
          ),
          ButtonSortBy(
            sortBy: 'Time: ending soonest',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          ButtonSortBy(
            sortBy: 'Time: newly listed',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          ButtonSortBy(
            sortBy: 'Price + Shipping: lowest first',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          ButtonSortBy(
            sortBy: 'Price + Shipping: highest first',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          ButtonSortBy(
            sortBy: 'Distance: nearest first',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
