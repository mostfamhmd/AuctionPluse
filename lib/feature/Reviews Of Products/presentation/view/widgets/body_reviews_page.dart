import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

import '../../../../Write Comments/presentation/view/write_comments_page.dart';
import 'comments_body.dart';

class BodyReviewsPage extends StatelessWidget {
  const BodyReviewsPage({super.key, required this.listProductReviews});
  final List<Review> listProductReviews;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          BodyComments(
            listProductReviews: listProductReviews,
          ),
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
