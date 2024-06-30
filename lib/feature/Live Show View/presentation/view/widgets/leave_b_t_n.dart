import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/leave_text.dart';

class LeaveBTN extends StatelessWidget {
  const LeaveBTN({
    super.key,
    required this.leave,
    this.onPressed,
  });
  final String leave;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: LeaveText(
        leave: leave,
      ),
    );
  }
}
