import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/grid_view_for_view_product.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class BodySpecificProducts extends StatefulWidget {
  const BodySpecificProducts({
    super.key,
    this.categoryName,
    this.subCategoryId,
    this.isBrand,
    this.brandId,
  });
  final String? categoryName;
  final String? subCategoryId;
  final bool? isBrand;
  final String? brandId;

  @override
  State<BodySpecificProducts> createState() => _BodySpecificProductsState();
}

class _BodySpecificProductsState extends State<BodySpecificProducts> {
  List<ProductInfo> products = [];
  List<ProductInfo> specificProducts = [];
  @override
  void initState() {
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: SingleChildScrollView(
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            products.clear();
            specificProducts.clear();
            if (state is GetProductsSuccess) {
              if (widget.isBrand == null) {
                for (var element in state.productsModel.data!) {
                  if (element.category!.name == widget.categoryName) {
                    products.add(element);
                  }
                }
                for (var element in products) {
                  for (int i = 0; i < element.subcategories!.length; i++) {
                    if (element.subcategories![i] == widget.subCategoryId) {
                      specificProducts.add(element);
                    }
                  }
                }
              } else {
                for (var element in state.productsModel.data!) {
                  if (element.brand! == widget.brandId) {
                    specificProducts.add(element);
                  }
                }
              }
              if (specificProducts.isNotEmpty) {
                return GridViewForViewProduct(
                  products: specificProducts,
                );
              } else {
                return const FailureState(error: "No Products Found");
              }
            } else if (state is GetProductsFailure) {
              return FailureState(error: state.error);
            } else if (state is GetProductsLoading) {
              return const LoadingState();
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
