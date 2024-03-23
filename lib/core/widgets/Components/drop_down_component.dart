import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class DropDownComponent extends StatefulWidget {
  const DropDownComponent(
      {super.key, this.onChanged, this.items, this.value, this.hint});
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final String? hint;
  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.hint ?? 'Select Category',
          style: AppStyles.kPoppins400.copyWith(
            fontSize: 14.sp,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: widget.items,
        value: widget.value,
        onChanged: widget.onChanged,
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
