import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/icons.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({
    super.key,
    required this.colors,
    this.onTap,
  });
  final void Function()? onTap;
  final ValueNotifier<List<Color>> colors;

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.colors,
      builder: (BuildContext context, value, Widget? child) => value.isEmpty
          ? InkWell(
              onTap: widget.onTap,
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
                    ? InkWell(
                        onTap: () {
                          widget.colors.value
                              .remove(widget.colors.value[index]);
                          setState(() {});
                        },
                        child: Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: value[index]),
                        ),
                      )
                    : InkWell(
                        onTap: widget.onTap,
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
