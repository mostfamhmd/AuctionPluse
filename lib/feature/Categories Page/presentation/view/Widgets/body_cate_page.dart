import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'category_item.dart';

class BodyCategoryPage extends StatefulWidget {
  const BodyCategoryPage({super.key});

  @override
  State<BodyCategoryPage> createState() => _BodyCategoryPageState();
}

class _BodyCategoryPageState extends State<BodyCategoryPage> {
  String? role;
  getRole() async {
    role = await AppConsts.getData(AppConsts.kUserRole);
  }

  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    context.read<GetProductsCubit>().getAllProducts();
    getRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesSuccess) {
          if (state.getCategories.data!.isEmpty) {
            return const FailureState(error: "No Products Found");
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.getCategories.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: CategoryItem(
                            role: role!,
                            category: state.getCategories.data![index],
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
  }
}
