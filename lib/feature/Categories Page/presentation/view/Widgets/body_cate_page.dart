import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'category_item.dart';

class BodyCategoryPage extends StatefulWidget {
  const BodyCategoryPage({super.key});

  @override
  State<BodyCategoryPage> createState() => _BodyCategoryPageState();
}

class _BodyCategoryPageState extends State<BodyCategoryPage> {
  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.getCategories.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: CategoryItem(
                          category: state.getCategories.data![index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else if (state is FetchCategoriesFailed) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                state.error.toString(),
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 22.sp,
                  color: AppColors.kDarkBlue,
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kDarkBlue,
            ),
          );
        }
      },
    );
  }
}
