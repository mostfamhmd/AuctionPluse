import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Payment%20Page/data/Model/payment_model_list.dart';
import 'package:smart_auction/feature/Payment%20Page/presentation/view/widgets/payment_method_item.dart';

import '../../../../Credit Card/presentation/view/credit_card_page.dart';

class BodyPaymentPage extends StatelessWidget {
  const BodyPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: paymentMethodModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: InkWell(
                    onTap: index == 0
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreditCardPage(),
                              ),
                            );
                          }
                        : () {},
                    child: PaymentMethodItem(
                      paymentMethodModel: paymentMethodModel[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
