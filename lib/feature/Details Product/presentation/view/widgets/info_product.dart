import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Selected%20Color%20Cubit/selected_color_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/body_details_product.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/commnet_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/name_product.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/rating_and_favorite.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/slider_widgets.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/specifications.dart';

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
  String color = '';
  @override
  Widget build(BuildContext context) {
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
              "${widget.infoProduct.product.price! - widget.infoProduct.product.discountedPrice!}",
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
                          color = widget.infoProduct.product.colors![index];
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
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
