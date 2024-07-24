import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class BodyComments extends StatefulWidget {
  const BodyComments(
      {super.key,
      required this.listProductReviews,
      required this.productId,
      this.userReview});
  final List<Review> listProductReviews;
  final String productId;
  final Review? userReview;

  @override
  State<BodyComments> createState() => _BodyCommentsState();
}

class _BodyCommentsState extends State<BodyComments> {
  List<String> time = [];
  String createdOrUpdated = '';
  @override
  void initState() {
    if (widget.userReview != null) {
      widget.listProductReviews.remove(widget.userReview);
    }
    for (int i = 0; i < widget.listProductReviews.length; i++) {
      if (widget.listProductReviews[i].createdAt! ==
          widget.listProductReviews[i].updatedAt) {
        String dateTimeString = widget.listProductReviews[i].createdAt!;
        DateTime dateTime = DateTime.parse(dateTimeString);
        String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
        createdOrUpdated = "created at ";
        time.add(createdOrUpdated + formattedDate);
      } else {
        String dateTimeString = widget.listProductReviews[i].updatedAt!;
        DateTime dateTime = DateTime.parse(dateTimeString);
        String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
        createdOrUpdated = "updated at ";
        time.add(createdOrUpdated + formattedDate);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listProductReviews.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            RatingWidget(rating: widget.listProductReviews[index].ratings!),
            SizedBox(
              height: 20.h,
            ),
            Text(
              widget.listProductReviews[index].title ?? "No Comment",
              style: TextStyle(
                fontFamily: AppFonts.kPoppins400,
                color: AppColors.kGray,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              time[index],
              style: TextStyle(
                fontFamily: AppFonts.kPoppins400,
                color: AppColors.kGray,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
