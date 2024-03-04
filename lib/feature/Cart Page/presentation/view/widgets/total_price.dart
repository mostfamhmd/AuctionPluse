import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import 'custom_price.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: AppColors.kGray.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          const CustomPrice(
            isTotal: false,
            price: r"$598.86",
            typePrice: "Items (3)",
          ),
          const Spacer(),
          const CustomPrice(
            isTotal: false,
            price: r"$40.00",
            typePrice: "Shipping",
          ),
          const Spacer(),
          const CustomPrice(
            isTotal: false,
            price: r"$128.00",
            typePrice: "Import charges",
          ),
          const Spacer(),
          Divider(
            indent: 0,
            endIndent: 0,
            thickness: 1.w,
            color: AppColors.kGray.withOpacity(0.3),
          ),
          const Spacer(),
          const CustomPrice(
            isTotal: true,
            price: r"$766.86",
            typePrice: "Total Price",
          ),
        ],
      ),
    );
  }
}
