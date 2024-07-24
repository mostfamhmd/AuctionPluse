// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

class ListTileUserRaiseHand extends StatelessWidget {
  const ListTileUserRaiseHand({
    super.key,
    required this.userName,
    this.onTap,
    required this.valBool,
    this.icon,
  });

  final String userName;
  final void Function()? onTap;
  final bool valBool;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: valBool,
      title: Text(userName),
      trailing: Icon(
        icon ?? Icons.front_hand,
        color: icon != null ? AppColors.kRed : AppColors.kBlue,
      ),
      leading: Icon(
        valBool == false ? Icons.add : Icons.remove,
        color: AppColors.kBlue,
      ),
      onTap: onTap,
    );
  }
}
