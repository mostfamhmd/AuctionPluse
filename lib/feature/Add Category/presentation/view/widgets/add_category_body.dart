// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_auction/core/managers/Category%20Cubits/Update%20Category%20Cubit/update_category_cubit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/manager/AddCategoryCubit/add_category_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';

import 'adding_category.dart';
import 'updating_category.dart';

class AddCategoryBody extends StatefulWidget {
  const AddCategoryBody({super.key, this.category});
  final Category? category;
  @override
  State<AddCategoryBody> createState() => _AddCategoryBodyState();
}

class _AddCategoryBodyState extends State<AddCategoryBody> {
  File? _photo;
  TextEditingController nameCategory = TextEditingController();
  final ValueNotifier<bool> _image = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  void initState() {
    if (widget.category != null) {
      nameCategory.text = widget.category!.name!;
      _image.value = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Category image",
              style: AppStyles.kPoppins400
                  .copyWith(fontSize: 20.sp, color: AppColors.kGray),
            ),
            SizedBox(
              height: 40.h,
            ),
            ValueListenableBuilder(
              valueListenable: _image,
              builder: (BuildContext context, bool value, Widget? child) =>
                  value
                      ? InkWell(
                          onTap: () => showImagePickerOption(context),
                          child: _photo != null
                              ? Image.file(
                                  _photo!,
                                  height: 250.h,
                                  width: 250.w,
                                  fit: BoxFit.contain,
                                )
                              : ImageComponent(
                                  urlImage: widget.category!.image!,
                                  height: 250.h,
                                  width: 250.w,
                                  radius: 0),
                        )
                      : InkWell(
                          onTap: () => showImagePickerOption(context),
                          child: SvgPicture.asset(
                            AppImages.kDefualt,
                          ),
                        ),
            ),
            SizedBox(
              height: 40.h,
            ),
            MyCustomField(
              myController: nameCategory,
              textAlign: TextAlign.center,
              hintText: "Category name",
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                if (_photo != null &&
                    nameCategory.text.isNotEmpty &&
                    widget.category == null) {
                  context.read<AddCategoryCubit>().addCategoryCubit(
                        name: nameCategory.text,
                        photo: _photo!,
                      );
                } else if (widget.category != null) {
                  context.read<UpdateCategoryCubit>().updateCategory(
                        categoryId: widget.category!.sId!,
                        image: _photo ?? widget.category!.image!,
                        name: nameCategory.text,
                      );
                }
              },
              child: MySmallBTN(
                nameButton: "Add Category",
                child: widget.category != null
                    ? UpdatingCategory(isLoading: isLoading)
                    : AddingCategory(isLoading: isLoading),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      uploadImage(context, ImageSource.gallery);
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70.sp,
                            color: Colors.black,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFonts.kPoppins400,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      uploadImage(context, ImageSource.camera);
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70.sp,
                            color: Colors.black,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFonts.kPoppins400,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          _photo = File(profPic.path);
          _image.value = true;
        }
      },
    );
  }
}
