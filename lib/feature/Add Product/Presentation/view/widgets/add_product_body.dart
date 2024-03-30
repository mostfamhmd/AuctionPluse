// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_brand.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_color.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_sub_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/info_add_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_color_for_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_image_product.dart';
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
  TextEditingController productQuantaty = TextEditingController();
  List<String> categories = [];
  List<String> idSubCategories = [];
  List<String> brands = [];
  List<Category> category = [];
  List<SubCategory> subCategory = [];
  List<Brands> brand = [];
  List<String> productColors = [];
  ValueNotifier<bool> isLoadingCategory = ValueNotifier(true);
  ValueNotifier<bool> isLoadingBrand = ValueNotifier(true);
  ValueNotifier<List<String>> subCategoryName = ValueNotifier([]);
  ValueNotifier<List<Color>> colors = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<List<File>> listImage = ValueNotifier([]);
  String? valCat;
  String? valBrand;
  String? idCatSelected;
  String? idBrandSelected;
  Color? selectedcolor;
  List<String> selectedItems = [];
  ValueNotifier<bool> coverImageFile = ValueNotifier(false);
  File? coverFile;
  bool isList = false;
  @override
  void dispose() {
    productName.dispose();
    productDescription.dispose();
    productPriceBeforeDiscount.dispose();
    productPrice.dispose();
    productQuantaty.dispose();
    super.dispose();
  }

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
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoProduct(
                    coverImage: () {
                      setState(() {
                        isList = false;
                        showImagePickerOption(context);
                      });
                    },
                    image: () {
                      setState(() {
                        isList = true;
                        showImagePickerOption(context);
                      });
                    },
                    listImage: listImage,
                    productQuantaty: productQuantaty,
                    productDescription: productDescription,
                    productName: productName,
                    productPrice: productPrice,
                    productPriceBeforeDiscount: productPriceBeforeDiscount,
                    iscoverImage: coverImageFile,
                    coverImageFile: coverFile,
                  ),
                  ChooseCategory(
                    isLoadingCategory: isLoadingCategory,
                    onChanged: (value) {
                      valCat = value;
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
                    selectedItems: selectedItems,
                    onChanged: (p0) => {},
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
                          return PickColorForProduct(
                            onColorChanged: (color) {
                              selectedcolor = color;
                              setState(() {});
                            },
                            selectedcolor: selectedcolor,
                            onPressed: () {
                              colors.value.add(selectedcolor!);
                              productColors.add('#' +
                                  selectedcolor!.value
                                      .toRadixString(16)
                                      .substring(2)
                                      .toUpperCase());
                              setState(() {});
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: MySmallBTN(
                      nameButton: "Add Product",
                      onTap: () {
                        getSubCategoriesList();
                        setState(() {});
                        if (productName.text.isNotEmpty &&
                            productPrice.text.isNotEmpty &&
                            productPriceBeforeDiscount.text.isNotEmpty &&
                            productDescription.text.isNotEmpty &&
                            productQuantaty.text.isNotEmpty &&
                            idCatSelected!.isNotEmpty &&
                            idBrandSelected!.isNotEmpty &&
                            productColors.isNotEmpty &&
                            idSubCategories.isNotEmpty &&
                            listImage.value.isNotEmpty &&
                            coverFile != null) {
                          context.read<AddProductCubit>().addProduct(
                              name: productName.value.text,
                              description: productDescription.value.text,
                              imageCover: coverFile!,
                              images: listImage.value,
                              brandId: idBrandSelected!,
                              categoryId: idCatSelected!,
                              subCategoriesId: idSubCategories,
                              realPrice: productPriceBeforeDiscount.value.text,
                              discountedPrice: productPrice.value.text,
                              quantity: productQuantaty.value.text,
                              colors: productColors);
                        }
                      },
                      child: BlocListener<AddProductCubit, AddProductState>(
                        listener: (context, state) {
                          if (state is AddProductLoading) {
                            isLoading.value = true;
                          } else if (state is AddProductSuccess) {
                            productName.clear();
                            productPrice.clear();
                            productPriceBeforeDiscount.clear();
                            productDescription.clear();
                            productQuantaty.clear();
                            selectedItems.clear();
                            idCatSelected = null;
                            idBrandSelected = null;
                            productColors.clear();
                            colors.value = [];
                            idSubCategories.clear();
                            listImage.value.clear();
                            coverImageFile.value = false;
                            isLoading.value = false;
                            setState(() {});
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(state.addProductModel.data!.name!),
                                content: Text(
                                  "Added Successfully",
                                  style: TextStyle(
                                    color: AppColors.kDarkBlue,
                                    fontFamily: AppFonts.kPoppins700,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            );
                            setState(() {});
                          } else if (state is AddProductFailure) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  "Failed",
                                  style: TextStyle(
                                    color: AppColors.kRed,
                                    fontFamily: AppFonts.kPoppins700,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                content:
                                    FailureState(error: state.errorMessage),
                              ),
                            );
                            isLoading.value = false;
                          } else {
                            isLoading.value = false;
                          }
                        },
                        child: ValueListenableBuilder(
                          valueListenable: isLoading,
                          builder: (BuildContext context, bool value,
                                  Widget? child) =>
                              value
                                  ? const LoadingState()
                                  : Center(
                                      child: Text(
                                        "Add Product",
                                        style: AppStyles.kPoppins500.copyWith(
                                            fontSize: 18.sp,
                                            color: AppColors.kBlack),
                                      ),
                                    ),
                        ),
                      ),
                    ),
                  ),
                ],
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
    for (int i = 0; i < subCategory.length; i++) {
      if (idCatSelected == subCategory[i].category) {
        subCategoryName.value.add(subCategory[i].name!);
      }
    }
  }

  getSubCategoriesList() {
    idSubCategories.clear();
    for (int i = 0; i < selectedItems.length; i++) {
      for (int j = 0; j < subCategory.length; j++) {
        if (selectedItems[i] == subCategory[j].name) {
          idSubCategories.add(subCategory[j].sId!);
        }
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return PickImageProduct(
          gallaryTap: () {
            uploadImage(context, ImageSource.gallery);
            Navigator.of(context).pop();
            setState(() {});
          },
          cameraTap: () {
            uploadImage(context, ImageSource.camera);
            Navigator.of(context).pop();
            setState(() {});
          },
        );
      },
    );
  }

  Future uploadImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? profPic = await picker.pickImage(source: source);
    setState(
      () {
        if (profPic != null) {
          if (isList == false) {
            coverFile = File(profPic.path);
            coverImageFile.value = true;
          } else {
            listImage.value.add(File(profPic.path));
          }
        }
      },
    );
  }
}
