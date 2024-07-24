// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';

class AddingProduct extends StatefulWidget {
  const AddingProduct({
    super.key,
  });

  @override
  State<AddingProduct> createState() => _AddingProductState();
}

class _AddingProductState extends State<AddingProduct> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductLoading) {
          isLoading.value = true;
        } else if (state is AddProductSuccess) {
          Navigator.pop(context);
        } else if (state is AddProductFailure) {
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
              content: FailureState(error: state.errorMessage),
            ),
          );
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (BuildContext context, bool value, Widget? child) => value
            ? const LoadingState()
            : Center(
                child: Text(
                  "Add Product",
                  style: AppStyles.kPoppins500
                      .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                ),
              ),
      ),
    );
  }
}
