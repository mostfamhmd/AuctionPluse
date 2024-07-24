import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';

class DetailsCoupon extends StatelessWidget {
  const DetailsCoupon({
    super.key,
    required this.name,
    required this.expirationDate,
    required this.discount,
  });
  final String name;
  final String expirationDate;
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyles.kPoppins700,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          expirationDate,
          style: AppStyles.kInter400.copyWith(fontSize: 16.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          discount,
          style: AppStyles.kInter400.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
