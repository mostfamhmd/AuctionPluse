import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Credit%20Card/presentation/view/widgets/pay_for_order_btn.dart';

import '../../../../Success Payment/presentation/view/payment_success_page.dart';
import 'card_name_holder.dart';
import 'card_number.dart';
import 'container_price_for_payment.dart';
import 'cvv_cvc.dart';
import 'exipry_date.dart';

class BodyCreditCardPage extends StatelessWidget {
  const BodyCreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ContainerPriceForPayment(),
          SizedBox(
            height: 35.h,
          ),
          const CartNumber(),
          SizedBox(
            height: 20.h,
          ),
          const CardHolderName(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35.w,
            ),
            child: Row(
              children: [
                const Flexible(
                  child: ExpiryDate(),
                ),
                SizedBox(
                  width: 30.w,
                ),
                const Flexible(
                  child: CvvCvc(),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Text(
            "We will send you an order details to your\n email after the successfull payment",
            style: TextStyle(
              color: AppColors.kGray,
              fontSize: 12.sp,
              fontFamily: AppFonts.kInter500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          PayForOrder(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentSuccessPage(),
                ),
                ModalRoute.withName('/'),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
