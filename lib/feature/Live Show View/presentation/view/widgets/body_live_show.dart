import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/user_name_with_leave.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/waiting_message.dart';

import 'add_comment_field_and_share_b_t_n.dart';

class BodyLiveShow extends StatelessWidget {
  const BodyLiveShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              userNameWithLeave(
                context,
                name: "Mostafa Desoky",
                followers: 69,
                watching: 10,
                leave: "Leave",
                rate: 4.5,
                onFollowTap: () {},
              ),
              const Spacer(),
              waitingMessage(timeStartingLive: 'Tomorrow, 12:00 Am'),
              const Spacer(),
              // add comment
              AddCommentFieldAndShareBTN(
                controller: TextEditingController(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
