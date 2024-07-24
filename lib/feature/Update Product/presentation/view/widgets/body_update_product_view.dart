import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Update%20Product/presentation/view/widgets/update_product.dart';

import '../../../../Sub Categories/presentation/view/manager/Fetch Sub Categories/fetch_sub_categories_cubit.dart';

class UpdateProductBody extends StatefulWidget {
  const UpdateProductBody({
    super.key,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPriceBeforeDiscount,
    required this.productPrice,
    required this.productQuantaty,
  });

  final String productId;

  final TextEditingController productName;
  final TextEditingController productDescription;
  final TextEditingController productPriceBeforeDiscount;
  final TextEditingController productPrice;
  final TextEditingController productQuantaty;

  @override
  State<UpdateProductBody> createState() => _UpdateProductBodyState();
}

class _UpdateProductBodyState extends State<UpdateProductBody> {
  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    context.read<FetchSubCategoriesCubit>().getSubCategories();
    context.read<GetBrandsCubit>().getBrands();
    super.initState();
  }

  List<String> categories = [];
  List<Category> category = [];
  ValueNotifier<bool> isLoadingCategory = ValueNotifier(true);
  List<String> brands = [];
  List<Brands> brand = [];
  ValueNotifier<bool> isLoadingBrand = ValueNotifier(true);
  List<SubCategory> subCategory = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchCategoriesCubit, FetchCategoriesState>(
      listener: (context, state) {
        if (state is FetchCategoriesSuccess) {
          category = state.getCategories.data!;
          categories = category.map((cat) => cat.name!).toList();
          isLoadingCategory.value = false;
        } else if (state is FetchCategoriesFailed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: FailureState(error: "${state.error} in Categories"),
            ),
          );
          isLoadingCategory.value = false;
        } else {
          isLoadingCategory.value = true;
        }
        setState(() {});
      },
      child: BlocListener<FetchSubCategoriesCubit, FetchSubCategoriesState>(
        listener: (context, state) {
          if (state is FetchSubCategoriesSuccess) {
            subCategory = state.subCategoriesModel.data!;
          } else if (state is FetchSubCategoriesFailed) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: FailureState(error: "${state.error} in Sub Categories"),
              ),
            );
          }
          setState(() {});
        },
        child: BlocListener<GetBrandsCubit, GetBrandsState>(
          listener: (context, state) {
            if (state is GetBrandsSuccess) {
              brand = state.getBrandsModel.data!;
              brands = brand.map((b) => b.name!).toList();
              isLoadingBrand.value = false;
            } else if (state is GetBrandsFailure) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: FailureState(error: "${state.errorMessage} in Brands"),
                ),
              );
              isLoadingBrand.value = false;
            } else {
              isLoadingBrand.value = true;
            }
            setState(() {});
          },
          child: UpdateProduct(
            categories: categories,
            categor: category,
            isLoadingCategory: isLoadingCategory,
            brand: brand,
            brands: brands,
            isLoadingBrand: isLoadingBrand,
            subCategory: subCategory,
            productId: widget.productId,
            // ===============
            productName: widget.productName,
            productDescription: widget.productDescription,
            productPrice: widget.productPrice,
            productPriceBeforeDiscount: widget.productPriceBeforeDiscount,
            productQuantaty: widget.productQuantaty,
          ),
        ),
      ),
    );
  }
}
