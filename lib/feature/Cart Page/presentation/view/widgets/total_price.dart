import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import 'custom_price.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice(
      {super.key,
      required this.totalPrice,
      required this.cartNumbers,
      this.totalPriceAfterDiscount});
  final String totalPrice;
  final int? totalPriceAfterDiscount;
  final int cartNumbers;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
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
          CustomPrice(
            isTotal: false,
            price: r"$" + totalPrice,
            typePrice: "Items ($cartNumbers)",
          ),
          const Spacer(),
          Divider(
            indent: 0,
            endIndent: 0,
            thickness: 1.w,
            color: AppColors.kGray.withOpacity(0.3),
          ),
          const Spacer(),
          CustomPrice(
            isTotal: true,
            price: r"$" +
                (totalPriceAfterDiscount != null
                    ? totalPriceAfterDiscount.toString()
                    : totalPrice),
            typePrice: "Total Price",
          ),
        ],
      ),
    );
  }
}
