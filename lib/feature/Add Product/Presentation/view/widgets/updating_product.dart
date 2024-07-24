// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/UpdateProductCubit/update_product_cubit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class UpdatingProduct extends StatefulWidget {
  const UpdatingProduct({
    super.key,
  });

  @override
  State<UpdatingProduct> createState() => _UpdatingProductState();
}

class _UpdatingProductState extends State<UpdatingProduct> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProductCubit, UpdateProductState>(
      listener: (context, state) {
        if (state is UpdateProductLoading) {
          isLoading.value = true;
          myLoadingSnackBar(context, "Loading");
        } else if (state is UpdateProductSuccess) {
          mySuccessSnackBar(context, "Updated Successfully");
          isLoading.value = false;
        } else if (state is UpdateProductFailure) {
          myErrorSnackBar(context, state.failure);
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (BuildContext context, bool value, Widget? child) =>
            value == true
                ? const LoadingState()
                : Center(
                    child: Text(
                      "Update Product",
                      style: AppStyles.kPoppins500
                          .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                    ),
                  ),
      ),
    );
  }
}
