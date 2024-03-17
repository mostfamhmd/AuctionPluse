import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/categories_body.dart';

class CubitCategoryState extends StatelessWidget {
  const CubitCategoryState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesSuccess) {
          return CategoryBody(categories: state.getCategories.data!);
        } else if (state is FetchCategoriesLoading) {
          return Center(
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 24.w,
            ),
          );
        } else if (state is FetchCategoriesFailed) {
          return Center(
            child: Text(
              state.error,
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
