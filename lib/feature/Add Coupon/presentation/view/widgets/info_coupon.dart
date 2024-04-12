import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Add%20New%20Coupon%20Cubit/add_new_coupon_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/manager/Update%20Coupon%20Cubit/update_coupon_cubit.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/view/widgets/add_coupon_btn.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/view/widgets/expiration_coupon.dart';

class InfoCoupon extends StatefulWidget {
  const InfoCoupon({
    super.key,
    this.couponId,
    this.couponName,
    this.couponExpiration,
    this.couponDiscount,
    required this.loading,
  });

  final String? couponId;
  final String? couponName;
  final String? couponExpiration;
  final num? couponDiscount;
  final ValueNotifier loading;
  @override
  State<InfoCoupon> createState() => _InfoCouponState();
}

class _InfoCouponState extends State<InfoCoupon> {
  TextEditingController couponName = TextEditingController();
  TextEditingController couponExpiration = TextEditingController();
  TextEditingController couponDiscount = TextEditingController();
  @override
  void initState() {
    if (widget.couponId != null) {
      couponName.text = widget.couponName!;
      couponExpiration.text = widget.couponExpiration!;
      couponDiscount.text = widget.couponDiscount!.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          MyCustomField(
            myController: couponName,
            textAlign: TextAlign.left,
            hintText: "Coupon name",
          ),
          SizedBox(
            height: 30.h,
          ),
          ExpirationCoupon(couponExpiration: couponExpiration),
          SizedBox(
            height: 30.h,
          ),
          MyCustomField(
            myController: couponDiscount,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            hintText: "Coupon discount",
          ),
          SizedBox(
            height: 30.h,
          ),
          AddCouponBTN(
            loading: widget.loading,
            onTap: () {
              if (couponName.text.isNotEmpty &&
                  couponDiscount.text.isNotEmpty &&
                  couponExpiration.text.isNotEmpty) {
                if (widget.couponId != null) {
                  context.read<UpdateCouponCubit>().updateSpecificCoupon(
                        name: couponName.text,
                        exipryDate: couponExpiration.text,
                        discount: num.parse(
                          couponDiscount.text,
                        ),
                        couponId: widget.couponId!,
                      );
                } else {
                  context.read<AddNewCouponCubit>().addNewCoupon(
                        name: couponName.text,
                        exipryDate: couponExpiration.text,
                        discount: num.parse(couponDiscount.text),
                      );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
