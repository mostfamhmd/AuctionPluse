import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.onChanged,
  });

  final void Function(bool p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColors.kBlack,
      activeTrackColor: AppColors.kBlue.withOpacity(0.6),
      value: true,
      onChanged: onChanged,
    );
  }
}
