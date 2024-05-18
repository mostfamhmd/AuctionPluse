import 'package:flutter/material.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/name_host.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/waiting_room_text.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WaitingRoomText(),
        NameHost(
          name: name,
        ),
      ],
    );
  }
}
