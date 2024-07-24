// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class AddCouponBTN extends StatelessWidget {
  const AddCouponBTN({
    super.key,
    required this.loading,
    this.onTap,
  });

  final ValueNotifier loading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MySmallBTN(
      onTap: onTap,
      nameButton: "Add Coupon",
      child: ValueListenableBuilder(
        valueListenable: loading,
        builder: (BuildContext context, value, Widget? child) => value == true
            ? const Center(
                child: LoadingState(),
              )
            : Center(
                child: Text(
                  "Add Coupon",
                  style: AppStyles.kPoppins500.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.kBlack,
                  ),
                ),
              ),
      ),
    );
  }
}
