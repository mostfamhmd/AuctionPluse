// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Update%20SubCategory%20Cubit/update_sub_category_cubit.dart';
import 'package:smart_auction/core/models/specific%20subcategory%20model/specific_subcategory_model.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/drop_down_component.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/manager/Add%20Sub%20Category%20Cubit/add_sub_category_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';

import 'adding_sub_category.dart';
import 'updating_sub_category.dart';

class AddSubCategoryBody extends StatefulWidget {
  const AddSubCategoryBody(
      {super.key,
      this.specificSubCategoryInfo,
      this.categoryName,
      this.categoryId});
  final SpecificSubCategoryInfo? specificSubCategoryInfo;
  final String? categoryName;
  final String? categoryId;
  @override
  State<AddSubCategoryBody> createState() => _AddSubCategoryBodyState();
}

class _AddSubCategoryBodyState extends State<AddSubCategoryBody> {
  ValueNotifier<List<String>> _catNames = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> _catID = ValueNotifier<List<String>>([]);
  ValueNotifier<bool> isDone = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);
  String? _selectedValue;
  String? selectCategory;
  TextEditingController nameSubCategory = TextEditingController(text: "");
  int? _id;

  @override
  void initState() {
    context.read<FetchCategoriesCubit>().getCategories();
    if (widget.specificSubCategoryInfo != null) {
      nameSubCategory.text = widget.specificSubCategoryInfo!.name!;
      selectCategory = widget.categoryName;
    }
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
                        ? DropDownComponent(
                            hint: selectCategory,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                                getidCategory();
                              });
                            },
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
                          )
                        : const LoadingState()),
            SizedBox(
              height: 30.h,
            ),
            MySmallBTN(
              nameButton: "Add Subcategory",
              onTap: () async {
                if (nameSubCategory.text != "" &&
                    _id != null &&
                    widget.specificSubCategoryInfo == null) {
                  context.read<AddSubCategoryCubit>().addSubCategory(
                      subName: nameSubCategory.text,
                      idCategory: _catID.value[_id!]);
                } else if (widget.specificSubCategoryInfo != null) {
                  context.read<UpdateSubCategoryCubit>().updateSubCategory(
                      subCategoryId: widget.specificSubCategoryInfo!.sId!,
                      name: nameSubCategory.text,
                      categoryId:
                          _id != null ? _catID.value[_id!] : widget.categoryId);
                }
              },
              child: widget.specificSubCategoryInfo != null
                  ? UpdatingSubCategory(isLoad: isLoad)
                  : AddingSubCategory(
                      isLoad: isLoad, nameSubCategory: nameSubCategory),
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
