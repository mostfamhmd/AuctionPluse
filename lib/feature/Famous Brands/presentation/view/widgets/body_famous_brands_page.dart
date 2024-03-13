import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/first_three_brands.dart';
import 'grid_view_item_builder.dart';

class BodyFamousBrandsPage extends StatefulWidget {
  const BodyFamousBrandsPage({super.key});

  @override
  State<BodyFamousBrandsPage> createState() => _BodyFamousBrandsPageState();
}

class _BodyFamousBrandsPageState extends State<BodyFamousBrandsPage> {
  @override
  void initState() {
    context.read<GetBrandsCubit>().getBrands();
    super.initState();
  }

  List<int> color = [0xFF3ACB3A, 0xFF538353, 0xFFFFB800];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<GetBrandsCubit, GetBrandsState>(
              builder: (context, state) {
                if (state is GetBrandsSuccess) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Column(
                      children: [
                        FirstThreeBrands(
                          brandName: state.getBrandsModel.data![index].name!,
                          rankColor: color[index],
                          rankNum: index + 1,
                          topCard: 0,
                          imageURL: state.getBrandsModel.data![index].image ??
                              "https://t4.ftcdn.net/jpg/03/15/18/09/240_F_315180932_rhiXFrJN27zXCCdrgx8V5GWbLd9zTHHA.jpg",
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  );
                } else if (state is GetBrandsFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: AppColors.kDarkBlue,
                        fontFamily: AppFonts.kPoppins700,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                } else if (state is GetBrandsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Try again later",
                      style: TextStyle(
                        color: AppColors.kDarkBlue,
                        fontFamily: AppFonts.kPoppins700,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<GetBrandsCubit, GetBrandsState>(
              builder: (context, state) {
                if (state is GetBrandsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetBrandsSuccess) {
                  List<Brands> remainingBrands =
                      state.getBrandsModel.data!.sublist(3);
                  if (remainingBrands.isNotEmpty) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 100.h,
                      ),
                      itemCount: remainingBrands.length,
                      itemBuilder: (context, index) {
                        return GridViewItemsBuilder(
                          name: remainingBrands[index].name!,
                          imageURL: remainingBrands[index].image ??
                              "https://t4.ftcdn.net/jpg/03/15/18/09/240_F_315180932_rhiXFrJN27zXCCdrgx8V5GWbLd9zTHHA.jpg",
                          rank: index + 4,
                        );
                      },
                    );
                  } else {
                    return const Center();
                  }
                } else {
                  return const Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
