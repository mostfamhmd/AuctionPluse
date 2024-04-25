// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/loading_or_not.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/manager/Add%20Sub%20Category%20Cubit/add_sub_category_cubit.dart';

class AddingSubCategory extends StatelessWidget {
  const AddingSubCategory({
    super.key,
    required this.isLoad,
    required this.nameSubCategory,
  });

  final ValueNotifier<bool> isLoad;
  final TextEditingController nameSubCategory;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSubCategoryCubit, AddSubCategoryState>(
      listener: (context, state) {
        if (state is AddSubCategorySuccess) {
          isLoad.value = false;
          nameSubCategory.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.addSubCategoryModel.data!.name!),
              content: Text(
                "Added Successfully",
                style: TextStyle(
                  color: AppColors.kDarkBlue,
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 18.sp,
                ),
              ),
            ),
          );
        } else if (state is AddSubCategoryLoading) {
          isLoad.value = true;
        } else if (state is AddSubCategoryFailure) {
          mySnackBar(context, state.error);
          isLoad.value = false;
        }
      },
      child: LoadingOrNot(
        isLoad: isLoad,
        nameBTN: "Add Subcategory",
      ),
    );
  }
}
