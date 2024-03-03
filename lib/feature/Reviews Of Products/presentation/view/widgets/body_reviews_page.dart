import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';

import '../../../../Write Comments/presentation/view/write_comments_page.dart';
import 'comments_body.dart';

class BodyReviewsPage extends StatelessWidget {
  const BodyReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          const BodyComments(),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyBigBTN(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WriteCommentsPage(),
                  ),
                );
              },
              nameBTN: "Write Review",
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
