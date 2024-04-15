// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_body.dart';

class CubitFamousBrandState extends StatelessWidget {
  const CubitFamousBrandState({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBrandsCubit, GetBrandsState>(
      builder: (context, state) {
        if (state is GetBrandsSuccess) {
          return FamousBrandsBody(
            brands: state.getBrandsModel.data!,
          );
        } else if (state is GetBrandsLoading) {
          return Center(
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 24.w,
            ),
          );
        } else if (state is GetBrandsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 18.sp,
                  color: AppColors.kDarkBlue),
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
