import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class ListViewComments extends StatefulWidget {
  const ListViewComments({
    super.key,
    required this.listProductReviews,
  });
  final List<Review> listProductReviews;

  @override
  State<ListViewComments> createState() => _ListViewCommentsState();
}

class _ListViewCommentsState extends State<ListViewComments> {
  List<String> time = [];
  String createdOrUpdated = '';
  @override
  void initState() {
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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.listProductReviews.length <= 3
          ? widget.listProductReviews.length
          : 3,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Row(
              children: [
                RatingWidget(rating: widget.listProductReviews[index].ratings!),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "${widget.listProductReviews[index].ratings}",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: AppFonts.kPoppins700,
                    color: AppColors.kGray,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
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
    );
  }
}
