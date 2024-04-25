// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/manager/AddCategoryCubit/add_category_cubit.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/view/add_category_view.dart';

class AddingCategory extends StatelessWidget {
  const AddingCategory({
    super.key,
    required this.isLoading,
  });

  final ValueNotifier<bool> isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCategoryCubit, AddCategoryState>(
      listener: (context, state) {
        if (state is AddCategoryLoading) {
          isLoading.value = true;
        } else if (state is AddCategorySuccess) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddCategoryView(),
            ),
          );
        } else if (state is AddCategoryFailed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Failed",
                style: TextStyle(
                  color: AppColors.kRed,
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 18.sp,
                ),
              ),
              content: Text(
                state.error,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.kPoppins400,
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
          isLoading.value = false;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (BuildContext context, bool value, Widget? child) => value
            ? LoadingState()
            : Center(
                child: Text(
                  "Add Category",
                  style: AppStyles.kPoppins500
                      .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                ),
              ),
      ),
    );
  }
}
