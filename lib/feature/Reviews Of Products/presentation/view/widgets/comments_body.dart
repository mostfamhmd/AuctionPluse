import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class BodyComments extends StatelessWidget {
  const BodyComments({super.key, required this.listProductReviews});
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
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listProductReviews.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            RatingWidget(rating: listProductReviews[index].ratings!),
            SizedBox(
              height: 20.h,
            ),
            Text(
              listProductReviews[index].user!.name!,
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
