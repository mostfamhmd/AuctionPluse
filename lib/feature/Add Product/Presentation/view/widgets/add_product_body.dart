import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_brand.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_color.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_sub_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/info_add_product.dart';
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
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPriceBeforeDiscount = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  List<String> categories = [];
  List<String> idSubCategories = [];
  List<String> brands = [];
  List<Category> category = [];
  List<SubCategory> subCategory = [];
  List<Brands> brand = [];
  ValueNotifier<bool> isLoadingCategory = ValueNotifier(true);
  ValueNotifier<bool> isLoadingBrand = ValueNotifier(true);
  ValueNotifier<List<String>> subCategoryName = ValueNotifier([]);
  ValueNotifier<List<Color>> colors = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(true);
  String? valCat;
  String? valSubCat;
  String? valBrand;
  String? idCatSelected;
  String? idBrandSelected;
  Color? selectedcolor;

  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    context.read<FetchSubCategoriesCubit>().getSubCategories();
    context.read<GetBrandsCubit>().getBrands();
    super.initState();
  }

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
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoProduct(
                      productDescription: productDescription,
                      productName: productName,
                      productPrice: productPrice,
                      productPriceBeforeDiscount: productPriceBeforeDiscount,
                    ),
                    ChooseCategory(
                      isLoadingCategory: isLoadingCategory,
                      onChanged: (value) {
                        valCat = value;
                        valSubCat = null;
                        getSubCategoryList();
                        setState(() {});
                      },
                      categories: categories,
                      valCat: valCat,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ChooseSubCategory(
                      subCategoryName: subCategoryName,
                      valSubCat: valSubCat,
                      onChanged: (value) {
                        valSubCat = value;
                        setState(() {});
                      },
                      idCatSelected: idCatSelected,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ChooseBrand(
                      isLoadingBrand: isLoadingBrand,
                      brands: brands,
                      valBrand: valBrand,
                      onChanged: (value) {
                        valBrand = value;
                        getIdBrand();
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Available colors of the product",
                      style: AppStyles.kPoppins500
                          .copyWith(fontSize: 16.sp, color: AppColors.kGray),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ChooseColor(
                      colors: colors,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: const Text(
                                'Pick Color',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              children: [
                                ColorPicker(
                                  pickerColor: selectedcolor ?? Colors.white,
                                  onColorChanged: (color) {
                                    selectedcolor = color;
                                    setState(() {});
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    onPressed: () {
                                      colors.value.add(selectedcolor!);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    color: AppColors.kDarkBlue,
                                    child: const Text(
                                      'Select Color',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: MySmallBTN(nameButton: "Add Product"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getSubCategoryList() {
    for (int i = 0; i < category.length; i++) {
      if (valCat == category[i].name) {
        idCatSelected = category[i].sId!;
      }
    }
    subCategoryName = ValueNotifier<List<String>>([]);
    idSubCategories.clear();
    for (int i = 0; i < subCategory.length; i++) {
      if (idCatSelected == subCategory[i].category) {
        subCategoryName.value.add(subCategory[i].name!);
        idSubCategories.add(subCategory[i].sId!);
      }
    }
  }

  getIdBrand() {
    for (int i = 0; i < brand.length; i++) {
      if (valBrand == brand[i].name) {
        idBrandSelected = brand[i].sId!;
      }
    }
  }
}
