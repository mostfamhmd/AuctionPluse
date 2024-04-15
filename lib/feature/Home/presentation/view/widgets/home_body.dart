import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/cubit_best_seller_state.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/cubit_famous_brand_state.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/cubit_category_state.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/recommended_product.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/slider_banners.dart';

import 'live_auction.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    context.read<GetBrandsCubit>().getBrands();
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

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
                      builder: (context) => HomeView(
                        currentIndex: 2,
                      ),
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
              const CubitCategoryState(),
              SizedBox(
                height: 20.h,
              ),
              const CubitBestSellerState(),
              SizedBox(
                height: 25.h,
              ),
              const RecommendedProduct(),
              SizedBox(
                height: 25.h,
              ),
              CubitFamousBrandState(),
            ],
          ),
        ),
      ),
    );
  }
}
