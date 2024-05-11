// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_auction/core/managers/UpdateProductCubit/update_product_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/adding_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_brand.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_color.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/choose_sub_category.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/info_add_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_color_for_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/pick_image_product.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/updating_product.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

int? indx;

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
    this.hintCategory,
    this.hintBrand,
    this.specificCategoryId,
    this.specificBrandId,
    this.specificSubCategoriesNames,
    this.specificSubCategoriesIDs,
    this.productInfo,
  });
  final ProductInfo? productInfo;
  final List<String> categories;
  final List<Category> categor;
  late ValueNotifier<bool> isLoadingCategory;
  final List<String> brands;
  final List<Brands> brand;
  late ValueNotifier<bool> isLoadingBrand;
  final List<SubCategory> subCategory;
  final String? hintCategory;
  final String? hintBrand;
  final String? specificCategoryId;
  final String? specificBrandId;
  final List<String>? specificSubCategoriesNames;
  final List<String>? specificSubCategoriesIDs;
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
  ValueNotifier<List<String>> subCategoryName =
      ValueNotifier(["Select Sub Category"]);
  ValueNotifier<List<Color>> colors = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<List<dynamic>> listImage = ValueNotifier([]);
  String? valCat;
  String? valBrand;
  String? idCatSelected;
  String? idBrandSelected;
  Color? selectedcolor;
  List<String> selectedItems = ["Select Sub Category"];
  ValueNotifier<bool> coverImageFile = ValueNotifier(false);
  dynamic coverFile;
  bool isList = false;
  @override
  void initState() {
    if (widget.productInfo != null) {
      productName.text = widget.productInfo!.name!;
      productDescription.text = widget.productInfo!.description!;
      productPrice.text = widget.productInfo!.price.toString();
      productPriceBeforeDiscount.text =
          widget.productInfo!.discountedPrice.toString();
      productQuantaty.text = widget.productInfo!.quantity.toString();
      //valCat = widget.productInfo!.category?.name;
      //idCatSelected = widget.specificCategoryId;
      //valBrand = widget.hintBrand;
      //idBrandSelected = widget.specificBrandId;
      for (int i = 0; i < widget.productInfo!.colors!.length; i++) {
        productColors.add(widget.productInfo!.colors![i]);
        String hexColor = widget.productInfo!.colors![i];
        int colorValue = int.parse(hexColor.substring(1), radix: 16);
        int finalColorValue = 0xFF000000 + colorValue;
        Color color = Color(finalColorValue);
        colors.value.add(color);
      }
      /*for (int i = 0; i < widget.specificSubCategoriesNames!.length; i++) {
        //subCategoryName.value.add(widget.specificSubCategoriesNames![i]);
      }
      for (int i = 0; i < widget.specificSubCategoriesIDs!.length; i++) {
        //idSubCategories.add(widget.specificSubCategoriesIDs![i]);
      }*/
    }
    setState(() {});
    super.initState();
  }

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
              hintCategory: valCat,
              isLoadingCategory: widget.isLoadingCategory,
              onChanged: (value) {
                valCat = value;
                subCategoryName =
                    ValueNotifier(["create new sub category first"]);
                selectedItems = ["create new sub category first"];
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
              hintBrand: valBrand,
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
                        setState(() {});
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
            widget.productInfo != null
                ? Align(
                    alignment: Alignment.topRight,
                    child: MySmallBTN(
                      nameButton: "Add Product",
                      onTap: () {
                        getSubCategoriesList();
                        productColors.clear();
                        for (int i = 0; i < colors.value.length; i++) {
                          String color = '#' +
                              colors.value[i].value
                                  .toRadixString(16)
                                  .substring(2);
                          productColors.add(color);
                        }
                        setState(() {});
                        if (productName.text.isNotEmpty &&
                            productPrice.text.isNotEmpty &&
                            productPriceBeforeDiscount.text.isNotEmpty &&
                            productDescription.text.isNotEmpty &&
                            productQuantaty.text.isNotEmpty &&
                            idCatSelected != null &&
                            idBrandSelected != null &&
                            productColors.isNotEmpty &&
                            idSubCategories.isNotEmpty &&
                            listImage.value.isNotEmpty &&
                            coverFile != null) {
                          context.read<UpdateProductCubit>().updateProductCubit(
                                productId: widget.productInfo!.id!,
                                productName: productName.value.text,
                                productDescription:
                                    productDescription.value.text,
                                imageFile: coverFile!,
                                listImageFile: listImage.value,
                                brandId: idBrandSelected!,
                                categoryId: idCatSelected!,
                                listSubCategoryId: idSubCategories,
                                productPrice:
                                    productPriceBeforeDiscount.value.text,
                                productDiscount: productPrice.value.text,
                                productQuantity: productQuantaty.value.text,
                                colors: productColors,
                              );
                        } else if (coverFile == null) {
                          myErrorSnackBar(
                              context, "selct Cover Image for this product");
                        } else if (listImage.value.isEmpty) {
                          myErrorSnackBar(context,
                              "select 1 image at least for this product");
                        } else if (idSubCategories.isEmpty) {
                          myErrorSnackBar(context,
                              "select sub category for this product or select new category contain sub category");
                        } else if (idBrandSelected == null) {
                          myErrorSnackBar(
                              context, "select brand for this product");
                        }
                      },
                      child: const UpdatingProduct(),
                    ),
                  )
                : Align(
                    alignment: Alignment.topRight,
                    child: MySmallBTN(
                      nameButton: "Add Product",
                      onTap: () {
                        getSubCategoriesList();
                        productColors.clear();
                        for (int i = 0; i < colors.value.length; i++) {
                          String color = '#' +
                              colors.value[i].value
                                  .toRadixString(16)
                                  .substring(2);
                          productColors.add(color);
                        }
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
                      child: const AddingProduct(),
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
    if (subCategoryName.value.isEmpty) {
      subCategoryName = ValueNotifier(["create new sub category first"]);
    }
    print("selecteeeeeeeeeeeeeeeeeeeed $selectedItems");
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
    print("selecteeeeeeeeeeeeeeeeeeeed $selectedItems");
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
