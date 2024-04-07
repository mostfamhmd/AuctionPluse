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
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

class InfoProduct extends StatelessWidget {
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
              images: infoProduct.product.images!,
            ),
            SizedBox(
              height: 10.h,
            ),
            NameProduct(
              productName: infoProduct.product.name!,
            ),
            SizedBox(
              height: 10.h,
            ),
            RatingAndFavorite(
              isFavorite: isFavorite,
              rating: infoProduct.product.ratingsAverage,
              productId: infoProduct.product.sId!,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${infoProduct.product.price! - infoProduct.product.discountedPrice!}",
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
              specification: infoProduct.product.description!,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommentsCubit(idProduct: infoProduct.product.id!),
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
