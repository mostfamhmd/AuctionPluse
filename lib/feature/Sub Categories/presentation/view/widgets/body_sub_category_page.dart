import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/widgets/item_sub_category.dart';

class BodySubCategoryPage extends StatefulWidget {
  const BodySubCategoryPage(
      {super.key, required this.categoryId, required this.categoryName});
  final String categoryId;
  final String categoryName;

  @override
  State<BodySubCategoryPage> createState() => _BodySubCategoryPageState();
}

class _BodySubCategoryPageState extends State<BodySubCategoryPage> {
  @override
  void initState() {
    context
        .read<SpecificSubCategoryCubit>()
        .getSpecificSubCategory(id: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificSubCategoryCubit, SpecificSubCategoryState>(
      builder: (context, state) {
        if (state is SpecificSubCategorySuccess) {
          if (state.specificSubCategoryList.data!.isEmpty) {
            return const FailureState(error: "No Sub Categories Found");
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.specificSubCategoryList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemSubCategory(
                          name:
                              state.specificSubCategoryList.data![index].name!,
                          subCategoryId:
                              state.specificSubCategoryList.data![index].sId!,
                          categoryName: widget.categoryName,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        } else if (state is SpecificSubCategoryError) {
          return FailureState(error: state.errMessage);
        } else {
          return Center(
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 24.sp,
            ),
          );
        }
      },
    );
  }
}
