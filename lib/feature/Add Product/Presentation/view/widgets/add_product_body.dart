import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/Brand%20Cubits/GetSpecificBrandCubit/get_specific_brand_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
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
    this.productInfo,
  });
  final ProductInfo? productInfo;

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  String? hintCategory;
  String? hintBrand;
  @override
  void initState() {
    if (widget.productInfo != null) {
      for (int i = 0; i < widget.productInfo!.subcategories!.length; i++) {
        context
            .read<SpecificSubCategoryCubit>()
            .getSpecificSubCategory(id: widget.productInfo!.subcategories![i]);
        specificSubCategoriesIDs.add(widget.productInfo!.subcategories![i]);
      }
      hintCategory = widget.productInfo!.category?.name;
      context
          .read<GetSpecificBrandCubit>()
          .getSpecificBrand(id: widget.productInfo!.brand);
      context.read<FetchCategoriesCubit>().getCategories();
      context.read<FetchSubCategoriesCubit>().getSubCategories();
      context.read<GetBrandsCubit>().getBrands();
    } else {
      context.read<FetchCategoriesCubit>().getCategories();
      context.read<FetchSubCategoriesCubit>().getSubCategories();
      context.read<GetBrandsCubit>().getBrands();
    }

    super.initState();
  }

  List<String> categories = [];
  String? specificCategoryId;
  String? specificBrandId;
  List<String> specificSubCategoriesNames = [];
  List<String> specificSubCategoriesIDs = [];
  List<Category> category = [];
  ValueNotifier<bool> isLoadingCategory = ValueNotifier(true);
  List<String> brands = [];
  List<Brands> brand = [];
  ValueNotifier<bool> isLoadingBrand = ValueNotifier(true);
  List<SubCategory> subCategory = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SpecificSubCategoryCubit, SpecificSubCategoryState>(
          listener: ((context, state) {
            if (state is SpecificSubCategoryLoading) {
              isLoadingCategory.value = true;
            } else if (state is SpecificSubCategorySuccess) {
              for (int i = 0;
                  i < state.specificSubCategoryList.data!.length;
                  i++) {
                specificSubCategoriesNames
                    .add(state.specificSubCategoryList.data![i].name!);
              }
              isLoadingCategory.value = false;
              setState(() {});
            } else if (state is SpecificSubCategoryError) {
              myErrorSnackBar(
                  context, "specfic subcategory error ${state.errMessage}");
              isLoadingCategory.value = false;
            } else {
              isLoadingCategory.value = false;
            }
            setState(() {});
          }),
        ),
        BlocListener<GetSpecificBrandCubit, GetSpecificBrandState>(
          listener: (context, state) {
            if (state is GetSpecificBrandLoading) {
              isLoadingCategory.value = true;
            } else if (state is GetSpecificBrandSuccess) {
              hintBrand = state.specificBrandModel.specificBrandInfo!.name;
              specificBrandId = state.specificBrandModel.specificBrandInfo!.sId;
              isLoadingCategory.value = false;
              setState(() {});
            } else if (state is GetSpecificBrandError) {
              myErrorSnackBar(context, "specfic brand error ${state.error}");
              isLoadingCategory.value = false;
            } else {
              isLoadingCategory.value = false;
            }
            setState(() {});
          },
        ),
        BlocListener<FetchCategoriesCubit, FetchCategoriesState>(
          listener: (context, state) {
            if (state is FetchCategoriesSuccess) {
              category = state.getCategories.data!;
              categories = category.map((cat) => cat.name!).toList();
              for (int i = 0; i < category.length; i++) {
                if (hintCategory == category[i].name) {
                  specificCategoryId = category[i].sId;
                }
              }
              isLoadingCategory.value = false;
              setState(() {});
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
        ),
        BlocListener<FetchSubCategoriesCubit, FetchSubCategoriesState>(
            listener: (context, state) {
          if (state is FetchSubCategoriesSuccess) {
            subCategory = state.subCategoriesModel.data!;
            for (int i = 0; i < specificSubCategoriesIDs.length; i++) {
              for (int j = 0; j < subCategory.length; j++) {
                if (specificSubCategoriesIDs[i] == subCategory[j].sId) {
                  specificSubCategoriesNames.add(subCategory[j].name!);
                }
              }
            }
            setState(() {});
          } else if (state is FetchSubCategoriesFailed) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: FailureState(error: "${state.error} in Sub Categories"),
              ),
            );
          }
          setState(() {});
        }),
        BlocListener<GetBrandsCubit, GetBrandsState>(
          listener: (context, state) {
            if (state is GetBrandsSuccess) {
              brand = state.getBrandsModel.data!;
              brands = brand.map((b) => b.name!).toList();
              isLoadingBrand.value = false;
              setState(() {});
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
        ),
      ],
      child: ProductBody(
        productInfo: widget.productInfo,
        hintCategory: hintCategory,
        hintBrand: hintBrand,
        specificCategoryId: specificCategoryId,
        specificBrandId: specificBrandId,
        specificSubCategoriesNames: specificSubCategoriesNames,
        specificSubCategoriesIDs: specificSubCategoriesIDs,
        categories: categories,
        categor: category,
        isLoadingCategory: isLoadingCategory,
        brand: brand,
        brands: brands,
        isLoadingBrand: isLoadingBrand,
        subCategory: subCategory,
      ),
    );
  }
}
