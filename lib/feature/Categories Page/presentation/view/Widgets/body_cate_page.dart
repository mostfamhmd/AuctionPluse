import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/managers/Category%20Cubits/Delete%20Category%20Cubit/delete_category_cubit.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Delete%20SubCategory%20Cubit/delete_sub_category_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/category_page.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';
import 'category_item.dart';

class BodyCategoryPage extends StatefulWidget {
  const BodyCategoryPage({super.key});

  @override
  State<BodyCategoryPage> createState() => _BodyCategoryPageState();
}

class _BodyCategoryPageState extends State<BodyCategoryPage> {
  List<String> idSubCategoryForCategory = [];
  List<List<String>> allIdSubCategoryForAllCategory = [];
  int? indx;
  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    context.read<FetchSubCategoriesCubit>().getSubCategories();
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteSubCategoryCubit, DeleteSubCategoryState>(
      listener: (context, deleteSubstate) {
        if (deleteSubstate is DeleteSubCategorySuccess) {
          mySnackBar(context, "Deleted Sub Category Successfully");
          allIdSubCategoryForAllCategory
              .remove(allIdSubCategoryForAllCategory[indx!]);
          setState(() {});
        } else if (deleteSubstate is DeleteSubCategoryError) {
          mySnackBar(context, deleteSubstate.error);
        } else if (deleteSubstate is DeleteSubCategoryLoading) {
          mySnackBar(context, "Deleting...");
        }
      },
      child: BlocListener<DeleteCategoryCubit, DeleteCategoryState>(
        listener: (context, state) {
          if (state is DeleteCategorySuccess) {
            mySnackBar(context, "Deleted Category Successfully");
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const CategoryPage(),
                ));
          } else if (state is DeleteCategoryError) {
            mySnackBar(context, state.error);
          } else if (state is DeleteCategoryLoading) {
            mySnackBar(context, "Deleting...");
          }
        },
        child: BlocBuilder<FetchSubCategoriesCubit, FetchSubCategoriesState>(
          builder: (context, substate) {
            if (substate is FetchSubCategoriesSuccess) {
              return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
                builder: (context, state) {
                  if (state is FetchCategoriesSuccess) {
                    if (state.getCategories.data!.isEmpty) {
                      return const FailureState(error: "No Categories Found");
                    } else {
                      for (int i = 0;
                          i < state.getCategories.data!.length;
                          i++) {
                        for (int j = 0;
                            j < substate.subCategoriesModel.data!.length;
                            j++) {
                          if (state.getCategories.data![i].sId ==
                              substate.subCategoriesModel.data![j].category) {
                            idSubCategoryForCategory
                                .add(substate.subCategoriesModel.data![j].sId!);
                          }
                        }
                        allIdSubCategoryForAllCategory
                            .add(idSubCategoryForCategory);
                        idSubCategoryForCategory = [];
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.getCategories.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 30.h),
                                    child: CategoryItem(
                                      onPressedEdit: () {},
                                      onPressedDelete: () {
                                        indx = index;
                                        context
                                            .read<DeleteCategoryCubit>()
                                            .deleteCategory(
                                                categoryId: state.getCategories
                                                    .data![index].sId!);
                                        for (int i = 0;
                                            i < idSubCategoryForCategory.length;
                                            i++) {
                                          context
                                              .read<DeleteSubCategoryCubit>()
                                              .deleteSubCategory(
                                                subCategoryId:
                                                    idSubCategoryForCategory[i],
                                              );
                                        }
                                        setState(() {});
                                      },
                                      role: role!,
                                      category:
                                          state.getCategories.data![index],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  } else if (state is FetchCategoriesFailed) {
                    return FailureState(error: state.error);
                  } else {
                    return const LoadingState();
                  }
                },
              );
            } else if (substate is FetchSubCategoriesFailed) {
              return FailureState(error: substate.error);
            } else if (substate is FetchSubCategoriesLoading) {
              return const LoadingState();
            } else {
              return const FailureState(error: "No state found");
            }
          },
        ),
      ),
    );
  }
}
