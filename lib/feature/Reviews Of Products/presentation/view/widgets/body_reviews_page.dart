import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/DeleteReviewCubit/delete_review_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/widgets/item_comment.dart';
import 'package:smart_auction/main.dart';

import '../../../../Write Comments/presentation/view/write_comments_page.dart';
import 'comments_body.dart';

class BodyReviewsPage extends StatefulWidget {
  const BodyReviewsPage(
      {super.key, required this.listProductReviews, required this.productId});
  final List<Review> listProductReviews;
  final String productId;

  @override
  State<BodyReviewsPage> createState() => _BodyReviewsPageState();
}

class _BodyReviewsPageState extends State<BodyReviewsPage> {
  Review? userReview;
  ValueNotifier<bool> isDelete = ValueNotifier<bool>(false);
  @override
  void initState() {
    for (int i = 0; i < widget.listProductReviews.length; i++) {
      if (widget.listProductReviews[i].user!.sId == userId) {
        userReview = widget.listProductReviews[i];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteReviewCubit, DeleteReviewState>(
      listener: (context, state) {
        if (state is DeleteReviewSuccess) {
          mySnackBar(context, "Removed Successfully");
          userReview = null;
          setState(() {});
          isDelete.value = true;
        } else if (state is DeleteReviewFailure) {
          mySnackBar(context, state.error);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userReview != null
                ? ValueListenableBuilder(
                    valueListenable: isDelete,
                    builder: (BuildContext context, value, Widget? child) =>
                        value == false
                            ? ItemComment(
                                userReview: userReview!,
                                onPressedDelete: () {
                                  context
                                      .read<DeleteReviewCubit>()
                                      .deleteReview(
                                        reviewId: userReview!.sId!,
                                      );
                                },
                                onPressedEdit: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WriteCommentsPage(
                                        reviewId: userReview!.sId!,
                                        userComment: userReview!.title!,
                                        rating: userReview!.ratings!,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(),
                  )
                : const Center(),
            SizedBox(
              height: 25.h,
            ),
            BodyComments(
              listProductReviews: widget.listProductReviews,
              productId: widget.productId,
              userReview: userReview,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyBigBTN(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WriteCommentsPage(
                        productId: widget.productId,
                      ),
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
      ),
    );
  }
}
