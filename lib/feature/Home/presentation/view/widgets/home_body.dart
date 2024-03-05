import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/best_seller_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/categories_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/famous_brands_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/recommended_product.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/slider_banners.dart';
import 'package:smart_auction/feature/Super%20Flash%20Sale%20Page/Presentation/view/super_flash_sale_page.dart';

import 'live_auction.dart';

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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(currentIndex: 2,),
                    ),
                  );
                },
                child: const SliderBanners(),
              ),
              SizedBox(
                height: 20.h,
              ),
              LiveAuction(
                seeAll: () {},
                viewShows: () {},
              ),
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
