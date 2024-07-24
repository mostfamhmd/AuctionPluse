import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

class MicIcon extends StatelessWidget {
  const MicIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kGray.withOpacity(.3),
      ),
      child: const Icon(
        Icons.mic,
        color: AppColors.kRed,
      ),
    );
  }
}
