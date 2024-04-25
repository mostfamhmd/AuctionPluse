// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Update%20SubCategory%20Cubit/update_sub_category_cubit.dart';
import 'package:smart_auction/core/widgets/Components/loading_or_not.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';

class UpdatingSubCategory extends StatelessWidget {
  const UpdatingSubCategory({
    super.key,
    required this.isLoad,
  });

  final ValueNotifier<bool> isLoad;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateSubCategoryCubit, UpdateSubCategoryState>(
      listener: (context, state) {
        if (state is UpdateSubCategorySuccess) {
          isLoad.value = false;
          mySnackBar(context, state.success);
        } else if (state is UpdateSubCategoryLoading) {
          isLoad.value = true;
        } else if (state is UpdateSubCategoryError) {
          mySnackBar(context, state.error);
          isLoad.value = false;
        }
      },
      child: LoadingOrNot(
        isLoad: isLoad,
        nameBTN: "Update Subcategory",
      ),
    );
  }
}
