import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/list_view_comments.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/reviews_page.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({super.key, required this.listProductReviews});
  final List<Review> listProductReviews;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(
          type: "Review Product",
          typeMore: "See More",
          onTap: () {
            if (listProductReviews.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsPage(
                    listProductReviews: listProductReviews,
                  ),
                ),
              );
            }
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        ListViewComments(
          listProductReviews: listProductReviews,
        ),
      ],
    );
  }
}
