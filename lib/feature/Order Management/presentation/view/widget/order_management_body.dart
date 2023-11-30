import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/widget/orders_list.dart';

class OrderManagementBody extends StatelessWidget {
  const OrderManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: const Column(
          children: [
            Expanded(
              child: OrdersList(),
            ),
          ],
        ),
      ),
    );
  }
}
