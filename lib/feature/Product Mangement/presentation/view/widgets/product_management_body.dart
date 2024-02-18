import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/Components/list_of_orders_or_products.dart';

class ProductManagementBody extends StatelessWidget {
  const ProductManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 5.h,bottom: 5.h),
        child: const Column(
          children: [
            Expanded(
              child: ListOfOrdersOrProducts(
                isEdit: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
