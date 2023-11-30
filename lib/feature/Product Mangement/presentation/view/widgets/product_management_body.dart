import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/products_list.dart';

class ProductManagementBody extends StatelessWidget {
  const ProductManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: const Column(
          children: [
            Expanded(
              child: ProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
