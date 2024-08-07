import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Specific%20Coupon%20Cubit/get_specific_coupon_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/apply_btn.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/swipe_to_delete.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/total_price.dart';
import 'package:smart_auction/feature/CheckOut%20Page/presentations/view/check_out_page.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';

class CubitBody extends StatefulWidget {
  const CubitBody({
    super.key,
    required this.getCartModel,
  });
  final GetCartModel getCartModel;

  @override
  State<CubitBody> createState() => _CubitBodyState();
}

class _CubitBodyState extends State<CubitBody> {
  ValueNotifier<String> totalPrice = ValueNotifier('');
  ValueNotifier<bool> applyCoupon = ValueNotifier(false);
  TextEditingController coupon = TextEditingController();
  @override
  void initState() {
    totalPrice =
        ValueNotifier(widget.getCartModel.data!.totalCartPrice!.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetSpecificCouponCubit, GetSpecificCouponState>(
      listener: (context, state) {
        int mostDiscount = 0;
        if (state is GetSpecificCouponSuccess) {
          for (int i = 0; i < state.specificCouponModel.data!.length; i++) {
            if (state.specificCouponModel.data![i].discount! > mostDiscount) {
              mostDiscount = state.specificCouponModel.data![i].discount!;
            }
          }
          if (widget.getCartModel.data!.totalCartPrice! > mostDiscount) {
            totalPrice.value =
                (widget.getCartModel.data!.totalCartPrice! - mostDiscount)
                    .toString();
            mySuccessSnackBar(context, "Applied Successfully");
            applyCoupon.value = true;
            context.read<GetCartProductCubit>().getCartProduct();
          }
        } else if (state is GetSpecificCouponLoading) {
          myLoadingSnackBar(context, "Loading ...");
        } else if (state is GetSpecificCouponError) {
          myErrorSnackBar(context, state.errorMessage);
        } else {
          myLoadingSnackBar(context, "Nothing to happend!");
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SwipeToDelete(
                getCartModel: widget.getCartModel,
              ),
              SizedBox(
                height: 10.h,
              ),
              ValueListenableBuilder(
                valueListenable: applyCoupon,
                builder: (BuildContext context, value, Widget? child) =>
                    MyCustomSuffixField(
                  myController: coupon,
                  isIcon: false,
                  textAlign: TextAlign.start,
                  hintText: "Enter Cupon Code",
                  widget: InkWell(
                    onTap: () {
                      if (value == true) {
                        mySuccessSnackBar(context, "Already Applied");
                      } else {
                        context
                            .read<GetSpecificCouponCubit>()
                            .getSpecificCoupon(couponName: coupon.text);
                      }
                    },
                    child: const ApplyBTN(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ValueListenableBuilder(
                valueListenable: totalPrice,
                builder: (BuildContext context, value, Widget? child) =>
                    TotalPrice(
                  totalPriceAfterDiscount:
                      widget.getCartModel.data?.totalPriceAfterDiscount,
                  totalPrice: totalPrice.value,
                  cartNumbers: widget.getCartModel.numOfCartItems!,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              BlocListener<AppCubit, AppStates>(
                listener: (BuildContext context, AppStates state) {
                  if (state is CheckOutLoading) {
                    const CircularProgressIndicator();
                  }
                  if (state is CheckOutSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPage(
                          id: state.checkOutModel.session!.id!,
                          cartId: widget.getCartModel.data!.sId!,
                        ),
                      ),
                    );
                  }
                },
                child: MyBigBTN(
                  nameBTN: "Check Out",
                  onTap: () async => context
                      .read<AppCubit>()
                      .checkOut(cartId: widget.getCartModel.data!.sId!),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
