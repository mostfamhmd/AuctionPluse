import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

import '../../../../../Search Result/presentation/view/search_result_page.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.kGray,
      style: AppStyles.kPoppins500,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => SearchResultPage()),
              ),
            );
          },
          child: SvgPicture.asset(
            AppIcons.kSearch,
            fit: BoxFit.none,
          ),
        ),
        hintText: "Search Product",
        hintStyle: AppStyles.kPoppins400.copyWith(),
        border: buildOutLineBorders(),
        enabledBorder: buildOutLineBorders(),
        focusedBorder: buildOutLineBorders(),
      ),
    );
  }

  OutlineInputBorder buildOutLineBorders() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: const BorderSide(color: AppColors.kGray));
  }
}
