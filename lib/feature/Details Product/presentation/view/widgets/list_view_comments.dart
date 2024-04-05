import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class ListViewComments extends StatelessWidget {
  const ListViewComments({
    super.key,
    required this.listProductReviews,
  });
  final List<Review> listProductReviews;
  @override
  Widget build(BuildContext context) {
    List<String> time = [];
    for (int i = 0; i < listProductReviews.length; i++) {
      String dateTimeString = listProductReviews[i].createdAt!;
      DateTime dateTime = DateTime.parse(dateTimeString);
      String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
      time.add(formattedDate);
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listProductReviews.length <= 3 ? listProductReviews.length : 3,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Row(
              children: [
                RatingWidget(rating: listProductReviews[index].ratings!),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "${listProductReviews[index].ratings}",
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
            listProductReviews[index].title ?? "No Comment",
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
