import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';

import 'widgets/body_add_coupon.dart';

class AddCouponPage extends StatelessWidget {
  const AddCouponPage(
      {super.key,
      this.couponId,
      this.couponName,
      this.couponExpiration,
      this.couponDiscount});
  final String? couponId;
  final String? couponName;
  final String? couponExpiration;
  final num? couponDiscount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Add a new coupon"),
      body: BodyAddCoupon(
        couponName: couponName,
        couponDiscount: couponDiscount,
        couponExpiration: couponExpiration,
        couponId: couponId,
      ),
    );
  }
}
