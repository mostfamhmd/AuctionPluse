// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/list_view_comments.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/DeleteReviewCubit/delete_review_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/reviews_page.dart';

class CommentBody extends StatelessWidget {
  const CommentBody(
      {super.key, required this.listProductReviews, required this.productId});
  final List<Review> listProductReviews;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(
          type: "Review Product",
          typeMore: "See More",
          onTap: () {
            if (listProductReviews.isNotEmpty) {
              context
                  .read<DeleteReviewCubit>()
                  .changeLengthListReview(newLength: listProductReviews.length);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsPage(
                    listProductReviews: listProductReviews,
                    productId: productId,
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
