import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Selected%20Color%20Cubit/selected_color_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/body_details_product.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/commnet_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/name_product.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/rating_and_favorite.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/slider_widgets.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/specifications.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Update%20Product/presentation/view/update_product_view.dart';

import 'add_to_cart_btn.dart';

class InfoProduct extends StatefulWidget {
  const InfoProduct({
    super.key,
    required this.infoProduct,
    required this.colors,
    required this.isFavorite,
  });

  final BodyDetailsProductPage infoProduct;
  final List<Color> colors;
  final ValueNotifier<bool> isFavorite;

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPriceBeforeDiscount = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productQuantaty = TextEditingController();

  String color = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var userData = cubit.loginDataModel;

          if (state is GetUserDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SliderWidget(
                    images: widget.infoProduct.product.images!,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NameProduct(
                    productName: widget.infoProduct.product.name!,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RatingAndFavorite(
                    isFavorite: widget.isFavorite,
                    rating: widget.infoProduct.product.ratingsAverage,
                    productId: widget.infoProduct.product.sId!,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${widget.infoProduct.product.price!}", // - widget.infoProduct.product.discountedPrice!
                    style: AppStyles.kPoppins700.copyWith(
                      color: AppColors.kLightBlue,
                      fontFamily: AppFonts.kPoppins700,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Select Color",
                    style: AppStyles.kPoppins700.copyWith(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.kPoppins700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<ColorCubit, Color>(
                    builder: (context, selectedColor) {
                      return Wrap(
                        children: List.generate(
                          widget.colors.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<ColorCubit>()
                                    .selectColor(widget.colors[index]);
                                color =
                                    widget.infoProduct.product.colors![index];
                                setState(() {});
                              },
                              child: CircleAvatar(
                                backgroundColor: widget.colors[index],
                                radius: 15.r,
                                child: selectedColor == widget.colors[index]
                                    ? const Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Specification",
                    style: AppStyles.kPoppins700.copyWith(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.kPoppins700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Specification(
                    specification: widget.infoProduct.product.description!,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  // -----------------------------------------------------------
                  widget.infoProduct.product.ownerId != userData!.data!.sId
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommentsCubit(
                              idProduct: widget.infoProduct.product.id!,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AddToCartBTN(
                              productId: widget.infoProduct.product.id!,
                              color: color,
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: MyBigBTN(
                            color: AppColors.kRed,
                            nameBTN: "Update product",
                            onTap: () {
                              productName.text =
                                  widget.infoProduct.product.name!;
                              productDescription.text =
                                  widget.infoProduct.product.description!;
                              productPriceBeforeDiscount.text = widget
                                  .infoProduct.product.discountedPrice
                                  .toString();
                              productPrice.text =
                                  widget.infoProduct.product.price.toString();
                              productQuantaty.text = widget
                                  .infoProduct.product.quantity
                                  .toString();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateProductsView(
                                    productId: widget.infoProduct.product.sId!,
                                    // =========================================
                                    productName: productName,
                                    productDescription: productDescription,
                                    productPrice: productPrice,
                                    productPriceBeforeDiscount:
                                        productPriceBeforeDiscount,
                                    productQuantaty: productQuantaty,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
