// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Add%20New%20Coupon%20Cubit/add_new_coupon_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Update%20Coupon%20Cubit/update_coupon_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/view/widgets/info_coupon.dart';

class BodyAddCoupon extends StatefulWidget {
  const BodyAddCoupon(
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
  State<BodyAddCoupon> createState() => _BodyAddCouponState();
}

class _BodyAddCouponState extends State<BodyAddCoupon> {
  ValueNotifier loading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return widget.couponId == null
        ? BlocListener<AddNewCouponCubit, AddNewCouponState>(
            listener: (context, state) {
              if (state is AddNewCouponSuccess) {
                loading.value = false;
                mySnackBar(context, "Added Successfully");
              } else if (state is AddNewCouponLoading) {
                loading.value = true;
              } else if (state is AddNewCouponError) {
                loading.value = false;
                mySnackBar(context, state.errorMessage);
              } else {
                loading.value = false;
              }
            },
            child: InfoCoupon(
              loading: loading,
            ),
          )
        : BlocListener<UpdateCouponCubit, UpdateCouponState>(
            listener: (context, state) {
              if (state is UpdateCouponSuccess) {
                loading.value = false;
                mySnackBar(context, "Updated Successfully");
              } else if (state is UpdateCouponLoading) {
                loading.value = true;
              } else if (state is UpdateCouponFailure) {
                loading.value = false;
                mySnackBar(context, state.error);
              } else {
                loading.value = false;
              }
            },
            child: InfoCoupon(
              couponName: widget.couponName,
              couponExpiration: widget.couponExpiration,
              couponDiscount: widget.couponDiscount,
              couponId: widget.couponId,
              loading: loading,
            ),
          );
  }
}
