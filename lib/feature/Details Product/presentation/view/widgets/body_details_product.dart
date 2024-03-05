import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/cart_page.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/select_color.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/slider_widgets.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/specifications.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/reviews_page.dart';

import '../../../../../core/widgets/Components/my_big_btn.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';
import 'list_view_comments.dart';
import 'name_product_favorite.dart';

class BodyDetailsProductPage extends StatelessWidget {
  const BodyDetailsProductPage({super.key});

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
            const SliderWidget(),
            SizedBox(
              height: 10.h,
            ),
            const NameProductFavorite(),
            SizedBox(
              height: 10.h,
            ),
            RatingWidget(
              rating: 4,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "87,000 EGP",
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
            const SelectColor(),
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
            const Specification(),
            SizedBox(
              height: 10.sp,
            ),
            CustomMore(
              type: "Review Product",
              typeMore: "See More",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewsPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            const ListViewComments(),
            SizedBox(
              height: 10.h,
            ),
            MyBigBTN(
              nameBTN: "Add To Cart",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(currentIndex: 1,),
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
