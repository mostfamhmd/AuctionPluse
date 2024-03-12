// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/manager/AddCategoryCubit/add_category_cubit.dart';

class AddCategoryBody extends StatefulWidget {
  const AddCategoryBody({super.key});

  @override
  State<AddCategoryBody> createState() => _AddCategoryBodyState();
}

class _AddCategoryBodyState extends State<AddCategoryBody> {
  File? _photo;
  TextEditingController nameCategory = TextEditingController();
  final ValueNotifier<bool> _image = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

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
                          child: Image.file(_photo!),
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
                if (_photo != null && nameCategory.text.isNotEmpty) {
                  context.read<AddCategoryCubit>().addCategoryCubit(
                        name: nameCategory.text,
                        photo: _photo!,
                      );
                }
              },
              child: Container(
                height: 45.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: AppColors.kLightBlue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: BlocListener<AddCategoryCubit, AddCategoryState>(
                  listener: (context, state) {
                    if (state is AddCategoryLoading) {
                      isLoading.value = true;
                    } else if (state is AddCategorySuccess) {
                      _photo = null;
                      _image.value = false;
                      nameCategory.clear();
                      isLoading.value = false;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(state.addCategoryModel.data!.name!),
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
                    } else if (state is AddCategoryFailed) {
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
                          content: Text(
                            state.error,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFonts.kPoppins400,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                      isLoading.value = false;
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, bool value, Widget? child) =>
                            value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "Add Category",
                                      style: AppStyles.kPoppins500.copyWith(
                                          fontSize: 18.sp,
                                          color: AppColors.kBlack),
                                    ),
                                  ),
                  ),
                ),
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
