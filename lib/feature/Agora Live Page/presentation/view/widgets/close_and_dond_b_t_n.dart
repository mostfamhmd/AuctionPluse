// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/action_button_for_dialog.dart';

class CloseAndDondBTN extends StatelessWidget {
  const CloseAndDondBTN({
    super.key,
    this.onDoneTap,
    this.onCloseTap,
    this.closeNameBTN,
    this.doneNameBTN,
  });

  final void Function()? onDoneTap;
  final void Function()? onCloseTap;
  final String? closeNameBTN;
  final String? doneNameBTN;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionButtonForDialog(
            nameBTN: closeNameBTN ?? "Close", onTap: onCloseTap),
        ActionButtonForDialog(nameBTN: doneNameBTN ?? "Done", onTap: onDoneTap),
      ],
    );
  }
}
