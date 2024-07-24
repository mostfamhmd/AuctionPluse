import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/Coupon%20Models/all_coupons_model.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'details_coupon.dart';
import 'edit_or_delete_btn.dart';

class InfoItemCoupon extends StatelessWidget {
  const InfoItemCoupon({
    super.key,
    required this.infoEachCoupon,
    this.onPressedDelete,
    this.onPressedEdit,
  });
  final InfoEachCoupon infoEachCoupon;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              DetailsCoupon(
                name: infoEachCoupon.name!,
                expirationDate: infoEachCoupon.expire!.substring(0, 10),
                discount: infoEachCoupon.discount!.toString(),
              ),
              const Spacer(),
              EditOrDeleteBTN(
                icon: Icons.edit,
                onPressed: onPressedEdit,
              ),
              EditOrDeleteBTN(
                icon: Icons.delete,
                onPressed: onPressedDelete,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Divider(
            color: AppColors.kGray,
            thickness: 1,
            indent: 10.w,
            endIndent: 10.w,
          ),
        ],
      ),
    );
  }
}
