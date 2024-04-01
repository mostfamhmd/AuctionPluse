import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Review%20Cubit/review_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Selected%20Color%20Cubit/selected_color_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/commnet_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/rating_and_favorite.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/slider_widgets.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/specifications.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

import '../../../../../core/widgets/Components/my_big_btn.dart';
import 'name_product.dart';

class BodyDetailsProductPage extends StatefulWidget {
  const BodyDetailsProductPage({super.key, required this.product});
  final ProductInfo product;

  @override
  State<BodyDetailsProductPage> createState() => _BodyDetailsProductPageState();
}

class _BodyDetailsProductPageState extends State<BodyDetailsProductPage> {
  List<Color> colors = [];
  @override
  void initState() {
    for (int i = 0; i < widget.product.colors!.length; i++) {
      String hexColor = widget.product.colors![i];
      int colorValue = int.parse(hexColor.substring(1), radix: 16);
      int finalColorValue = 0xFF000000 + colorValue;
      Color color = Color(finalColorValue);
      colors.add(color);
    }
    context.read<ReviewCubit>().getAllReviews();
    super.initState();
  }

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
              images: widget.product.images!,
            ),
            SizedBox(
              height: 10.h,
            ),
            NameProduct(
              productName: widget.product.name!,
            ),
            SizedBox(
              height: 10.h,
            ),
            RatingAndFavorite(rating: widget.product.ratingsAverage),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${widget.product.price! - widget.product.discountedPrice!}",
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
                    colors.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<ColorCubit>().selectColor(colors[index]);
                        },
                        child: CircleAvatar(
                          backgroundColor: colors[index],
                          radius: 15.r,
                          child: selectedColor == colors[index]
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
              specification: widget.product.description!,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommentsCubit(idProduct: widget.product.id!),
            SizedBox(
              height: 10.h,
            ),
            MyBigBTN(
              nameBTN: "Add To Cart",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(
                      currentIndex: 1,
                    ),
                  ),
                );
              },
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
