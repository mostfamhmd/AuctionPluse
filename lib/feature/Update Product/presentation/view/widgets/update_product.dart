// ignore_for_file: must_be_immutable

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
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_brand.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_color.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_sub_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/info_add_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_color_for_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_image_product.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({
    super.key,
    required this.categories,
    required this.isLoadingCategory,
    required this.categor,
    required this.brands,
    required this.brand,
    required this.isLoadingBrand,
    required this.subCategory,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPriceBeforeDiscount,
    required this.productPrice,
    required this.productQuantaty,
  });

  final List<String> categories;
  final List<Category> categor;
  late ValueNotifier<bool> isLoadingCategory;
  final List<String> brands;
  final List<Brands> brand;
  late ValueNotifier<bool> isLoadingBrand;
  final List<SubCategory> subCategory;
  final String productId;

  final TextEditingController productName;
  final TextEditingController productDescription;
  final TextEditingController productPriceBeforeDiscount;
  final TextEditingController productPrice;
  final TextEditingController productQuantaty;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  List<String> idSubCategories = [];
  List<String> productColors = [];
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
  Widget build(BuildContext context) {
    return Padding(
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
              productQuantaty: widget.productQuantaty,
              productDescription: widget.productDescription,
              productName: widget.productName,
              productPrice: widget.productPrice,
              productPriceBeforeDiscount: widget.productPriceBeforeDiscount,
              iscoverImage: coverImageFile,
              coverImageFile: coverFile,
            ),
            ChooseCategory(
              isLoadingCategory: widget.isLoadingCategory,
              onChanged: (value) {
                valCat = value;
                getSubCategoryList();
                setState(() {});
              },
              categories: widget.categories,
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
              isLoadingBrand: widget.isLoadingBrand,
              brands: widget.brands,
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
                        productColors.add(
                          '#${selectedcolor!.value.toRadixString(16).substring(2).toUpperCase()}',
                        );
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
                nameButton: "Update",
                onTap: () {
                  getSubCategoriesList();
                  setState(() {});
                  context.read<AppCubit>().updateProduct(
                        productId: widget.productId,
                        name: widget.productName.value.text,
                        description: widget.productDescription.value.text,
                        imageFile: coverFile!,
                        listImageFile: listImage.value,
                        category: idCatSelected!,
                        subCategories: idSubCategories,
                        price: widget.productPriceBeforeDiscount.value.text,
                        discount: widget.productPrice.value.text,
                        quantity: widget.productQuantaty.value.text,
                      );
                },
                child: BlocListener<AppCubit, AppStates>(
                  listener: (context, state) {
                    if (state is UpdateProductLoading) {
                      isLoading.value = true;
                    } else if (state is UpdateProductSuccess) {
                      Navigator.pop(context);
                    } else if (state is UpdateProductFailure) {
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
                          content: FailureState(error: state.error),
                        ),
                      );
                      isLoading.value = false;
                    } else {
                      isLoading.value = false;
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, bool value, Widget? child) =>
                            value
                                ? const LoadingState()
                                : Center(
                                    child: Text(
                                      "Update",
                                      style: AppStyles.kPoppins500.copyWith(
                                        fontSize: 18.sp,
                                        color: AppColors.kBlack,
                                      ),
                                    ),
                                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSubCategoryList() {
    for (int i = 0; i < widget.categor.length; i++) {
      if (valCat == widget.categor[i].name) {
        idCatSelected = widget.categor[i].sId!;
      }
    }
    subCategoryName = ValueNotifier<List<String>>([]);
    for (int i = 0; i < widget.subCategory.length; i++) {
      if (idCatSelected == widget.subCategory[i].category) {
        subCategoryName.value.add(widget.subCategory[i].name!);
      }
    }
  }

  getSubCategoriesList() {
    idSubCategories.clear();
    for (int i = 0; i < selectedItems.length; i++) {
      for (int j = 0; j < widget.subCategory.length; j++) {
        if (selectedItems[i] == widget.subCategory[j].name) {
          idSubCategories.add(widget.subCategory[j].sId!);
        }
      }
    }
  }

  getIdBrand() {
    for (int i = 0; i < widget.brand.length; i++) {
      if (valBrand == widget.brand[i].name) {
        idBrandSelected = widget.brand[i].sId!;
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
