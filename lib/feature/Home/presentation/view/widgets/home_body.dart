import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/best_seller_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/categories_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/famous_brands_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/recommended_product.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/slider_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              const SliderBody(numberAds: 5),
              SizedBox(
                height: 20.h,
              ),
              const CategoryBody(),
              const BestSellerBody(),
              SizedBox(
                height: 25.h,
              ),
              const RecommendedProduct(),
              SizedBox(
                height: 25.h,
              ),
              const FamousBrandsBody(),
            ],
          ),
        ),
      ),
    );
  }
}
