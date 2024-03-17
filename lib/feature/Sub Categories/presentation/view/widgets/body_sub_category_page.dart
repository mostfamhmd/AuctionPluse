import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/managers/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
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
  List<ProductInfo> productsList = [];
  @override
  void initState() {
    context
        .read<SpecificSubCategoryCubit>()
        .getSpecificSubCategory(id: widget.categoryId);
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetProductsCubit, GetProductsState>(
      listener: (context, state) {
        if (state is GetProductsSuccess) {
          for (int i = 0; i < state.productsModel.data!.length; i++) {
            if (state.productsModel.data![i].category!.name ==
                widget.categoryName) {
              productsList.add(state.productsModel.data![i]);
            }
          }
        }
      },
      child: BlocBuilder<SpecificSubCategoryCubit, SpecificSubCategoryState>(
        builder: (context, state) {
          if (state is SpecificSubCategorySuccess) {
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
                          productsList: productsList,
                          categoryId: widget.categoryId,
                          categoryName: widget.categoryName,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (state is SpecificSubCategoryError) {
            return Center(
              child: Text(
                state.errMessage,
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 22.sp,
                  color: AppColors.kDarkBlue,
                ),
              ),
            );
          } else {
            return Center(
                child: SpinKitThreeBounce(
              color: Colors.black,
              size: 24.sp,
            ));
          }
        },
      ),
    );
  }
}
