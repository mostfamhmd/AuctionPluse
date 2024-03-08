import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/widgets/item_sub_category.dart';

class BodySubCategoryPage extends StatefulWidget {
  const BodySubCategoryPage({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<BodySubCategoryPage> createState() => _BodySubCategoryPageState();
}

class _BodySubCategoryPageState extends State<BodySubCategoryPage> {
  List<SubCategory> subCategoryList = [];
  @override
  void initState() {
    context.read<FetchSubCategoriesCubit>().getSubCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSubCategoriesCubit, FetchSubCategoriesState>(
      builder: (context, state) {
        subCategoryList.clear();
        if (state is FetchSubCategoriesSuccess) {
          for (int i = 0; i < state.subCategoriesModel.data!.length; i++) {
            if (widget.categoryId ==
                state.subCategoriesModel.data![i].category) {
              subCategoryList.add(state.subCategoriesModel.data![i]);
            }
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: subCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: ItemSubCategory(
                          subCategories: subCategoryList[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else if (state is FetchSubCategoriesFailed) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(
                fontFamily: AppFonts.kPoppins700,
                fontSize: 22.sp,
                color: AppColors.kDarkBlue,
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
