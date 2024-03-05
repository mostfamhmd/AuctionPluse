import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Payment%20Page/data/Model/payment_method_model.dart';

import '../../../../../../core/utils/styles.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({super.key, required this.paymentMethodModel});

  final PaymentMethodModel paymentMethodModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(paymentMethodModel.paymentIcon),
        SizedBox(
          width: 30.w,
        ),
        Text(
          paymentMethodModel.paymentName,
          style: AppStyles.kInter700.copyWith(
            fontSize: 16.sp,
            color: AppColors.kDarkBlue,
            fontFamily: AppFonts.kInter700,
          ),
        ),
      ],
    );
  }
}
