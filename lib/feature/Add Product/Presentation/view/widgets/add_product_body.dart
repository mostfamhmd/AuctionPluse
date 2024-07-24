import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/product_body.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';

import '../../../../Categories Page/data/Model/category_model.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({
    super.key,
  });
  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
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
          child: ProductBody(
            categories: categories,
            categor: category,
            isLoadingCategory: isLoadingCategory,
            brand: brand,
            brands: brands,
            isLoadingBrand: isLoadingBrand,
            subCategory: subCategory,
          ),
        ),
      ),
    );
  }
}
