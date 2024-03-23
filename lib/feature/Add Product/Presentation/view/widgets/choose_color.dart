import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/icons.dart';

class ChooseColor extends StatelessWidget {
  const ChooseColor({super.key, required this.colors, this.onTap});
  final void Function()? onTap;
  final ValueNotifier<List<Color>> colors;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colors,
      builder: (BuildContext context, value, Widget? child) => value.isEmpty
          ? InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                AppIcons.kAddColor,
                height: 35.h,
                width: 35.w,
              ),
            )
          : Wrap(
              spacing: 20.w,
              children: List.generate(
                value.length + 1,
                (index) => index <= value.length - 1
                    ? Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: value[index]),
                      )
                    : InkWell(
                        onTap: onTap,
                        child: SvgPicture.asset(
                          AppIcons.kAddColor,
                          height: 35.h,
                          width: 35.w,
                        ),
                      ),
              ),
            ),
    );
  }
}
