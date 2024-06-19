import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.onChanged,
    required this.caseSwitch,
  });

  final void Function(bool p1)? onChanged;
  final bool caseSwitch;
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColors.kBlack,
      activeTrackColor: AppColors.kLightBlue,
      value: caseSwitch,
      onChanged: onChanged,
    );
  }
}
