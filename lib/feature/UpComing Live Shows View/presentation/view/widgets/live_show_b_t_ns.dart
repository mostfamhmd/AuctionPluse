import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/invite_friends_b_t_n.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/join_now_b_t_n.dart';

class LiveShowBTNs extends StatelessWidget {
  const LiveShowBTNs({
    super.key,
    this.onJoinedTap,
    this.onLetKnowTap,
    this.onInviteFriendsTap,
  });
  final void Function()? onJoinedTap;
  final void Function()? onLetKnowTap;
  final void Function()? onInviteFriendsTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        JoinNowBTN(
          onPressed: onJoinedTap,
        ),
        SizedBox(width: 10.w),
        /*LetMeKnowBTN(
          onPressed: onLetKnowTap,
        ),*/
        const Spacer(),
        InviteFriendsBTN(
          onPressed: onInviteFriendsTap,
        ),
      ],
    );
  }
}
