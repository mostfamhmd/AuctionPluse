import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class DropDown extends StatelessWidget {
  const DropDown(
      {super.key,
      required this.onChanged,
      required this.isDone,
      required this.listItems,
      required this.selectedValue});
  final void Function(String?)? onChanged;
  final ValueNotifier<bool> isDone;
  final ValueNotifier<List<String>> listItems;
  final String selectedValue;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDone,
      builder: (BuildContext context, value, Widget? child) => value
          ? DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Expanded(
                  child: Text(
                    'Select Category',
                    style: AppStyles.kPoppins400
                        .copyWith(fontSize: 14.sp, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                items: listItems.value
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
                value: selectedValue,
                onChanged: onChanged,
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
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
    );
  }
}
