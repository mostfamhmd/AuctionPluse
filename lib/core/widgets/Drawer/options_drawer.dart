import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/order_management_view.dart';
import 'package:smart_auction/feature/Product%20mangement/presentation/view/product_mangement_view.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomeView(),
              ),
            );
          },
          child: Text(
            "Home",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const OrderManagementView(),
              ),
            );
          },
          child: Text(
            "Order mangement",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const ProductManagementView(),
              ),
            );
          },
          child: Text(
            "Product mangement",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Add a brand",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Add a category",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Add a subcategory",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Add a product",
            style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
