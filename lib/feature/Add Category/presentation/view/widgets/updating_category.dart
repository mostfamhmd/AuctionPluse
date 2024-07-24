// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Category%20Cubits/Update%20Category%20Cubit/update_category_cubit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class UpdatingCategory extends StatelessWidget {
  const UpdatingCategory({
    super.key,
    required this.isLoading,
  });

  final ValueNotifier<bool> isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCategoryCubit, UpdateCategoryState>(
      listener: (context, state) {
        if (state is UpdateCategoryLoading) {
          isLoading.value = true;
        } else if (state is UpdateCategorySuccess) {
          isLoading.value = false;
          mySuccessSnackBar(context, state.success);
        } else if (state is UpdateCategoryError) {
          myErrorSnackBar(context, state.error);
          isLoading.value = false;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (BuildContext context, bool value, Widget? child) => value
            ? LoadingState()
            : Center(
                child: Text(
                  "Update Category",
                  style: AppStyles.kPoppins500
                      .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                ),
              ),
      ),
    );
  }
}
