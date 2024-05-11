import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Update%20Product%20Cart%20Cubit/update_product_cart_cubit.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import 'plus_minus_btn.dart';

class BuyingContainer extends StatefulWidget {
  const BuyingContainer({
    super.key,
    required this.productInfo,
    this.cartItem,
    required this.index,
  });
  final ProductInfo productInfo;
  final CartItems? cartItem;
  final int index;

  @override
  State<BuyingContainer> createState() => _BuyingContainerState();
}

class _BuyingContainerState extends State<BuyingContainer> {
  String colors = '';
  int? color;
  ValueNotifier<int> counter = ValueNotifier<int>(1);

  @override
  void initState() {
    colors = widget.cartItem!.color!.replaceAll("#", "0xFF");
    color = int.parse(colors);

    if (widget.productInfo.quantity! >= widget.cartItem!.quantity!) {
      counter = ValueNotifier<int>(widget.cartItem!.quantity!);
    } else {
      counter = ValueNotifier<int>(widget.productInfo.quantity!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProductCartCubit, UpdateProductCartState>(
      listener: (context, state) {
        if (state is UpdateProductCartSuccess) {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      HomeView(
                        currentIndex: 1,
                      )));
        } else if (state is UpdateProductCartError) {
          myErrorSnackBar(context, state.errorMessage);
        }
      },
      child: Container(
        height: 110.h,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: AppColors.kGray.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ImageComponent(
                urlImage: widget.productInfo.imageCover!,
                height: 100.h,
                width: 70.w,
                radius: 0),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productInfo.name!,
                  style: TextStyle(
                    color: AppColors.kDarkBlue,
                    fontFamily: AppFonts.kPoppins700,
                    fontSize: 12.sp,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Color(color!),
                  radius: 15.r,
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  r"$" +
                      (widget.productInfo.price! -
                              widget.productInfo.discountedPrice!)
                          .toString(),
                  style: TextStyle(
                    color: AppColors.kBlue,
                    fontFamily: AppFonts.kPoppins700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.kGray.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      if (counter.value == 1) {
                      } else {
                        context
                            .read<UpdateProductCartCubit>()
                            .updateProductCart(
                                productCartId: widget.cartItem!.sId!,
                                quantity: counter.value - 1);
                      }
                    },
                    child: const PlusMinusBTN(
                      btnName: "-",
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (BuildContext context, value, Widget? child) =>
                        Text(
                      "$value",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.kPoppins500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      if (counter.value < widget.productInfo.quantity!) {
                        context
                            .read<UpdateProductCartCubit>()
                            .updateProductCart(
                                productCartId: widget.cartItem!.sId!,
                                quantity: counter.value + 1);
                      } else {
                        myLoadingSnackBar(context,
                            "There is no more than ${widget.productInfo.quantity!} of this product");
                      }
                    },
                    child: const PlusMinusBTN(
                      btnName: "+",
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
