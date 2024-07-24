import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/rating_widget.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';

class ItemComment extends StatefulWidget {
  const ItemComment({
    super.key,
    required this.userReview,
    this.onPressedDelete,
    this.onPressedEdit,
  });

  final Review userReview;
  final void Function()? onPressedDelete;
  final void Function()? onPressedEdit;
  @override
  State<ItemComment> createState() => _ItemCommentState();
}

class _ItemCommentState extends State<ItemComment> {
  String time = '';
  String createdOrUpdated = '';
  @override
  void initState() {
    if (widget.userReview.createdAt == widget.userReview.updatedAt) {
      String dateTimeString = widget.userReview.createdAt!;
      DateTime dateTime = DateTime.parse(dateTimeString);
      String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
      time = formattedDate;
      createdOrUpdated = "created at ";
    } else {
      String dateTimeString = widget.userReview.updatedAt!;
      DateTime dateTime = DateTime.parse(dateTimeString);
      String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
      time = formattedDate;
      createdOrUpdated = "updated at ";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            RatingWidget(rating: widget.userReview.ratings!),
            const Spacer(),
            IconButton(
              onPressed: widget.onPressedEdit,
              icon: const Icon(
                Icons.edit,
                color: AppColors.kGray,
              ),
            ),
            IconButton(
              onPressed: widget.onPressedDelete,
              icon: const Icon(
                Icons.delete,
                color: AppColors.kRed,
              ),
            ),
          ],
        ),
        Text(
          widget.userReview.title ?? "No Comment",
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
          createdOrUpdated + time,
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
    );
  }
}
