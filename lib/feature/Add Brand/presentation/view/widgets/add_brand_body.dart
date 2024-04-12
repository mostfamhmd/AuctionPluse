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
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/manager/Add%20Brand%20Cubit/add_brand_cubit.dart';

class AddBrandBody extends StatefulWidget {
  const AddBrandBody({super.key});

  @override
  State<AddBrandBody> createState() => _AddBrandBodyState();
}

class _AddBrandBodyState extends State<AddBrandBody> {
  TextEditingController nameBrand = TextEditingController();
  File? _photo;
  final ValueNotifier<bool> _image = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Brand image",
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
              myController: nameBrand,
              textAlign: TextAlign.center,
              hintText: "Brand name",
            ),
            SizedBox(
              height: 30.h,
            ),
            MySmallBTN(
              onTap: () {
                if (_photo != null && nameBrand.text.isNotEmpty) {
                  context.read<AddBrandCubit>().addBrand(
                        name: nameBrand.text,
                        photo: _photo!,
                      );
                }
              },
              nameButton: "Add Brand",
              child: BlocListener<AddBrandCubit, AddBrandState>(
                listener: (context, state) {
                  if (state is AddBrandLoading) {
                    isLoading.value = true;
                  } else if (state is AddBrandSuccess) {
                    _photo = null;
                    _image.value = false;
                    nameBrand.clear();
                    isLoading.value = false;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(state.addBrandModel.data!.name!),
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
                  } else if (state is AddBrandFailure) {
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
                          state.errorMessage,
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
                  builder: (BuildContext context, bool value, Widget? child) =>
                      value
                          ? const Center(child: LoadingState())
                          : Center(
                              child: Text(
                                "Add Brand",
                                style: AppStyles.kPoppins500.copyWith(
                                    fontSize: 18.sp, color: AppColors.kBlack),
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
