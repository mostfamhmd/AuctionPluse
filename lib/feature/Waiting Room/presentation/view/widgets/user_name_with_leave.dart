import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'count_watching_and_leave_b_t_n.dart';
import 'name_of_host.dart';

Row userNameWithLeave(
  BuildContext context, {
  required String name,
  required num rate,
  required void Function() onFollowTap,
  required int watching,
  required String leave,
  required int followers,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // user avatar
      CircleAvatar(
        radius: 20.r,
      ),
      SizedBox(width: 20.w),
      // user name
      NameOfHost(
        name: name,
        rate: rate,
        onFollowTap: onFollowTap,
        followers: followers,
      ),
      const Spacer(),
      // leave
      CountWatchingAndLeaveBTN(
        watching: watching,
        leave: leave,
      ),
    ],
  );
}
