// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class DropDown extends StatefulWidget {
  DropDown(
      {super.key,
      required this.items,
      required this.selectedValue,
      this.onChanged});
  final List<DropdownMenuItem<String>> items;
  late String? selectedValue;
  final void Function(String?)? onChanged;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Select Category',
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 13.sp,
            color: AppColors.kDarkBlue,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: widget.items,
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        style: AppStyles.kPoppins400.copyWith(
          fontSize: 14.sp,
          color: Colors.black,
        ),
        buttonStyleData: buttonStyleData(),
        iconStyleData: iconStyleData(),
        dropdownStyleData: dropdownStyleData(),
      ),
    );
  }

  ButtonStyleData buttonStyleData() {
    return ButtonStyleData(
      width: 130.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
    );
  }

  IconStyleData iconStyleData() {
    return IconStyleData(
      icon: SvgPicture.asset(
        AppIcons.kArrowMenu,
        fit: BoxFit.none,
      ),
    );
  }

  DropdownStyleData dropdownStyleData() {
    return DropdownStyleData(
      isOverButton: true,
      maxHeight: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      offset: Offset(-20.w, 0),
      scrollbarTheme: ScrollbarThemeData(
        radius: Radius.circular(40.r),
      ),
    );
  }
}
