import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/Coupon%20Models/all_coupons_model.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Coupon/presentation/view/add_coupon_page.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/manager/Delete%20Coupon%20Cubit/delete_coupon_cubit.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/manager/Get%20All%20Coupons%20Cubit/get_all_coupons_cubit.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/view/coupons_management_page.dart';
import 'info_item_coupon.dart';

class BodyCouponsManagement extends StatefulWidget {
  const BodyCouponsManagement({super.key});

  @override
  State<BodyCouponsManagement> createState() => _BodyCouponsManagementState();
}

class _BodyCouponsManagementState extends State<BodyCouponsManagement> {
  @override
  void initState() {
    context.read<GetAllCouponsCubit>().getAllCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCouponsCubit, GetAllCouponsState>(
      builder: (context, state) {
        if (state is GetAllCouponsSucccess) {
          List<InfoEachCoupon> listCoupons = [];
          for (int i = 0; i < state.allCouponsModel.data!.length; i++) {
            listCoupons.add(state.allCouponsModel.data![i]);
          }
          return BlocListener<DeleteCouponCubit, DeleteCouponState>(
            listener: (context, delete) {
              if (delete is DeleteCouponSuccess) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) =>
                          const CouponsManagementPage()),
                );
                mySnackBar(context, delete.success);
              } else if (delete is DeleteCouponFailure) {
                mySnackBar(context, delete.error);
              } else if (delete is DeleteCouponLoading) {
                mySnackBar(context, "Loading...");
              } else {
                mySnackBar(context, "something has gone wrong");
              }
            },
            child: listCoupons.isNotEmpty
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
                    child: ListView.builder(
                      itemCount: listCoupons.length,
                      itemBuilder: (BuildContext context, int index) =>
                          InfoItemCoupon(
                        infoEachCoupon: listCoupons[index],
                        onPressedEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCouponPage(
                                couponId: listCoupons[index].sId!,
                                couponDiscount: listCoupons[index].discount!,
                                couponName: listCoupons[index].name!,
                                couponExpiration:
                                    listCoupons[index].expire!.substring(0, 10),
                              ),
                            ),
                          );
                        },
                        onPressedDelete: () {
                          context
                              .read<DeleteCouponCubit>()
                              .deleteCoupon(couponId: listCoupons[index].sId!);
                        },
                      ),
                    ),
                  )
                : const Center(
                    child: FailureState(error: "No Coupons to show"),
                  ),
          );
        } else if (state is GetAllCouponsFailure) {
          return Center(child: FailureState(error: state.errorMessage));
        } else if (state is GetAllCouponsLoading) {
          return const Center(
            child: LoadingState(),
          );
        } else {
          return const Center(
            child: FailureState(error: "Nothing to show"),
          );
        }
      },
    );
  }
}
