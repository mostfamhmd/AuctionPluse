// ignore_for_file: prefer_final_fields

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/loading_or_not.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/manager/Add%20Sub%20Category%20Cubit/add_sub_category_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';

class AddSubCategoryBody extends StatefulWidget {
  const AddSubCategoryBody({super.key});

  @override
  State<AddSubCategoryBody> createState() => _AddSubCategoryBodyState();
}

class _AddSubCategoryBodyState extends State<AddSubCategoryBody> {
  ValueNotifier<List<String>> _catNames = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> _catID = ValueNotifier<List<String>>([]);
  ValueNotifier<bool> isDone = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  String? _selectedValue;
  TextEditingController nameSubCategory = TextEditingController(text: "");
  int? _id;

  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchCategoriesCubit, FetchCategoriesState>(
      listener: (context, state) {
        if (state is FetchCategoriesSuccess) {
          for (int i = 0; i < state.getCategories.data!.length; i++) {
            _catNames.value.add(state.getCategories.data![i].name!);
            _catID.value.add(state.getCategories.data![i].sId!);
          }
          isDone.value = true;
        } else if (state is FetchCategoriesFailed) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.error),
                  ));
        } else {
          isDone.value = false;
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            MyCustomField(
              myController: nameSubCategory,
              textAlign: TextAlign.left,
              hintText: "Subcategory name",
            ),
            SizedBox(
              height: 30.h,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isDone,
              builder: (BuildContext context, bool value, Widget? child) =>
                  value
                      ? DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Category',
                              style: AppStyles.kPoppins400.copyWith(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: _catNames.value
                                .map(
                                  (String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: AppStyles.kPoppins400.copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList(),
                            value: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                                getidCategory();
                              });
                            },
                            style: AppStyles.kPoppins400.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            buttonStyleData: ButtonStyleData(
                              height: 62.h,
                              width: MediaQuery.sizeOf(context).width,
                              padding: EdgeInsets.symmetric(horizontal: 9.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppColors.kGray),
                                color: Colors.white,
                              ),
                            ),
                            iconStyleData: IconStyleData(
                              icon: SvgPicture.asset(
                                AppIcons.kArrowMenu,
                                fit: BoxFit.none,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              isOverButton: true,
                              maxHeight: 200.h,
                              width:
                                  (MediaQuery.sizeOf(context).width - 50.w).w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              offset: Offset(-20.w, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: Radius.circular(40.r),
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
            ),
            SizedBox(
              height: 30.h,
            ),
            MySmallBTN(
              nameButton: "Add Subcategory",
              onTap: () async {
                if (nameSubCategory.text != "" && _id != null) {
                  context.read<AddSubCategoryCubit>().addSubCategory(
                      subName: nameSubCategory.text,
                      idCategory: _catID.value[_id!]);
                }
              },
              child: BlocListener<AddSubCategoryCubit, AddSubCategoryState>(
                listener: (context, state) {
                  if (state is AddSubCategorySuccess) {
                    isLoad.value = false;
                    nameSubCategory.clear();

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(state.addSubCategoryModel.data!.name!),
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
                  } else if (state is AddSubCategoryLoading) {
                    isLoad.value = true;
                  } else {
                    isLoad.value = false;
                  }
                },
                child: LoadingOrNot(
                  isLoad: isLoad,
                  nameBTN: "Add Subcategory",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getidCategory() {
    for (int i = 0; i < _catNames.value.length; i++) {
      if (_selectedValue == _catNames.value[i]) {
        _id = i;
      }
    }
  }
}
