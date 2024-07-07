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
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_brand.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_color.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_sub_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/info_add_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_color_for_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_image_product.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

class ProductBody extends StatefulWidget {
  ProductBody({
    super.key,
    required this.categories,
    required this.isLoadingCategory,
    required this.categor,
    required this.brands,
    required this.brand,
    required this.isLoadingBrand,
    required this.subCategory,
  });

  final List<String> categories;
  final List<Category> categor;
  late ValueNotifier<bool> isLoadingCategory;
  final List<String> brands;
  final List<Brands> brand;
  late ValueNotifier<bool> isLoadingBrand;
  final List<SubCategory> subCategory;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPriceBeforeDiscount = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productQuantaty = TextEditingController();
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
              productQuantaty: productQuantaty,
              productDescription: productDescription,
              productName: productName,
              productPrice: productPrice,
              productPriceBeforeDiscount: productPriceBeforeDiscount,
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
                          colors: productColors,
                        );
                  }
                },
                child: BlocListener<AddProductCubit, AddProductState>(
                  listener: (context, state) {
                    if (state is AddProductLoading) {
                      isLoading.value = true;
                    } else if (state is AddProductSuccess) {
                      Navigator.pop(context);
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
                          content: FailureState(error: state.errorMessage),
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
                                      "Add Product",
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
