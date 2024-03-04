import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/icons.dart';
import 'buying_container.dart';

class SwipeToDelete extends StatefulWidget {
  SwipeToDelete({super.key, required this.length});

  late int length;

  @override
  State<SwipeToDelete> createState() => _SwipeToDeleteState();
}

class _SwipeToDeleteState extends State<SwipeToDelete> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        children: [
          SwipeActionCell(
            key: ObjectKey(index),
            trailingActions: <SwipeAction>[
              SwipeAction(
                backgroundRadius: 5.r,
                widthSpace: 50.w,
                icon: Center(
                  child: SvgPicture.asset(
                    AppIcons.kRemove,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onTap: (CompletionHandler handler) async {
                  await handler(true);
                  widget.removeAt(index);
                  setState(() {});
                },
                color: AppColors.kLightBlue,
              ),
            ],
            child: widget[index],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

List<Widget> widget = const [
  BuyingContainer(),
  BuyingContainer(),
  BuyingContainer(),
  BuyingContainer(),
  BuyingContainer(),
];
