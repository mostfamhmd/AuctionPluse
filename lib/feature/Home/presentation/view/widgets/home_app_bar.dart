import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/search_field.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50.h,
          width: 280.w,
          child: SearchField(
            textEditingController: textEditingController,
          ),
        ),
        SvgPicture.asset(AppIcons.kFavorite),
        SvgPicture.asset(AppIcons.kMore),
      ],
    );
  }
}
