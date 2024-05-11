import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/row_selected_item.dart';

class DropDownListSubCategory extends StatefulWidget {
  const DropDownListSubCategory({
    super.key,
    required this.subCategoryName,
    this.selectedItems,
    this.onChanged,
  });
  final List<String> subCategoryName;
  final List<String>? selectedItems;
  final void Function(dynamic)? onChanged;
  @override
  State<DropDownListSubCategory> createState() =>
      _DropDownListSubCategoryState();
}

class _DropDownListSubCategoryState extends State<DropDownListSubCategory> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<dynamic>(
        isExpanded: true,
        hint: Text(
          'Select Sub Category',
          style: AppStyles.kPoppins400.copyWith(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        items: widget.subCategoryName.map((item) {
          return DropdownMenuItem(
            value: item,
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = widget.selectedItems!.contains(item);
                return InkWell(
                  onTap: () {
                    isSelected
                        ? widget.selectedItems!.remove(item)
                        : widget.selectedItems!.add(item);
                    setState(() {});
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RowSelected(
                      isSelected: isSelected,
                      item: item,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        value:
            widget.selectedItems!.isEmpty ? null : widget.selectedItems!.last,
        onChanged: widget.onChanged,
        selectedItemBuilder: (context) {
          return widget.selectedItems!.map(
            (item) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                alignment: AlignmentDirectional.center,
                child: Text(
                  widget.selectedItems!.join(', '),
                  style: AppStyles.kPoppins400.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ).toList();
        },
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
          isOverButton: false,
          maxHeight: 200.h,
          width: (MediaQuery.sizeOf(context).width - 50.w).w,
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
    );
  }
}
