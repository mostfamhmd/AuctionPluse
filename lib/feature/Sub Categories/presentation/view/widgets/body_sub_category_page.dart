import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Delete%20SubCategory%20Cubit/delete_sub_category_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/view/add_sub_category_view.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/sub_category_page.dart';
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
  int? indx;
  @override
  void initState() {
    context
        .read<SpecificSubCategoryCubit>()
        .getSpecificSubCategory(id: widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteSubCategoryCubit, DeleteSubCategoryState>(
      listener: (context, deleteSubstate) {
        if (deleteSubstate is DeleteSubCategorySuccess) {
          mySuccessSnackBar(context, "Deleted Sub Category Successfully");
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SubCategoryPage(
                  categoryId: widget.categoryId,
                  categoryName: widget.categoryName,
                ),
              ));
        } else if (deleteSubstate is DeleteSubCategoryError) {
          myErrorSnackBar(context, deleteSubstate.error);
        } else if (deleteSubstate is DeleteSubCategoryLoading) {
          myLoadingSnackBar(context, "Deleting...");
        }
      },
      child: BlocBuilder<SpecificSubCategoryCubit, SpecificSubCategoryState>(
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
                            onPressedDelete: () {
                              indx = index;
                              context
                                  .read<DeleteSubCategoryCubit>()
                                  .deleteSubCategory(
                                      subCategoryId: state
                                          .specificSubCategoryList
                                          .data![index]
                                          .sId!);
                            },
                            onPressedEdit: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      AddSubCategoryView(
                                    specificSubCategoryInfo: state
                                        .specificSubCategoryList.data![index],
                                    categoryId: widget.categoryId,
                                    categoryName: widget.categoryName,
                                  ),
                                ),
                              );
                            },
                            name: state
                                .specificSubCategoryList.data![index].name!,
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
      ),
    );
  }
}
