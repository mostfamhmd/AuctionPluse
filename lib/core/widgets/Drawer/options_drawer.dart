import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/add_brand_view.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/view/add_category_view.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/view/add_coupon_page.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/add_product_view.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/view/add_sub_category_view.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/view/coupons_management_page.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/order_management_view.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/product_mangement_view.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/up_coming_live_shows_view.dart';

class OptionsDrawer extends StatefulWidget {
  const OptionsDrawer({super.key});

  @override
  State<OptionsDrawer> createState() => _OptionsDrawerState();
}

class _OptionsDrawerState extends State<OptionsDrawer> {
  String userRole = '';

  Future<String> getUserRole() async {
    userRole = await AppConsts.getData(AppConsts.kUserRole);

    setState(() {});

    return userRole;
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                  (route) => false,
                );
              },
              leading: Text(
                "Home",
                style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
              ),
            ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const OrderManagementView(),
                    ),
                  );
                },
                leading: Text(
                  "Order mangement",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const ProductManagementView(),
                    ),
                  );
                },
                leading: Text(
                  "Product mangement",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const CouponsManagementPage(),
                    ),
                  );
                },
                leading: Text(
                  "Coupons mangement",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AddBrandView(),
                    ),
                  );
                },
                leading: Text(
                  "Add a brand",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AddCategoryView(),
                    ),
                  );
                },
                leading: Text(
                  "Add a category",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AddSubCategoryView(),
                    ),
                  );
                },
                leading: Text(
                  "Add a subcategory",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),
            ListTile(
              dense: true,
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AddProductsView(),
                  ),
                );
              },
              leading: Text(
                "Add a product",
                style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
              ),
            ),

            // -----------------------------------
            if (userRole == 'admin')
              ListTile(
                dense: true,
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AddCouponPage(),
                    ),
                  );
                },
                leading: Text(
                  "Add a coupon",
                  style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
                ),
              ),
            ListTile(
              dense: true,
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const UpComingLiveShowsView(),
                  ),
                );
              },
              leading: Text(
                "Auctions",
                style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
              ),
            ),

            ListTile(
              dense: true,
              onTap: () {
                AppCubit.get(context).logout(context);
              },
              leading: Text(
                "Logout",
                style: AppStyles.kInter600.copyWith(fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
