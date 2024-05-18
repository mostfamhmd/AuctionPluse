import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/leave_text.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/up_coming_live_shows_view.dart';

class LeaveBTN extends StatelessWidget {
  const LeaveBTN({
    super.key,
    required this.leave,
  });
  final String leave;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const UpComingLiveShowsView(),
        ),
        (route) => false,
      ),
      child: LeaveText(
        leave: leave,
      ),
    );
  }
}
