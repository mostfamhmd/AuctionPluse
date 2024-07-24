import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/EditReviewCubit/edit_review_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/rating_comment.dart';

import '../../../../../core/widgets/Components/my_custom_field.dart';
import 'done_btn.dart';

class BodyWriteCommentsPage extends StatefulWidget {
  const BodyWriteCommentsPage(
      {super.key,
      required this.productId,
      this.reviewId,
      this.userComment,
      this.rating});
  final String? productId;
  final String? reviewId;
  final String? userComment;
  final num? rating;
  @override
  State<BodyWriteCommentsPage> createState() => _BodyWriteCommentsPageState();
}

class _BodyWriteCommentsPageState extends State<BodyWriteCommentsPage> {
  TextEditingController myController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  String addComment = "Add Comment";
  String editComment = "Edit Comment";
  String myBtn = '';
  @override
  void initState() {
    if (widget.userComment != null) {
      myController.text = widget.userComment!;
      context.read<AddCommentCubit>().ratings = widget.rating!.toDouble();
      myBtn = editComment;
    } else {
      myBtn = addComment;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCommentCubit, AddCommentState>(
      listener: (context, state) {
        if (state is AddCommentSuccess) {
          isLoading.value = false;
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is AddCommentLoading) {
          isLoading.value = true;
        } else if (state is AddCommentFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: FailureState(error: state.errorMessage),
            ),
          );
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      },
      builder: (BuildContext context, AddCommentState state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Please write Overall level of satisfaction with your shipping / Delivery Service",
                  style: TextStyle(
                    color: AppColors.kDarkBlue,
                    fontFamily: AppFonts.kPoppins700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const RatingComment(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Write Your Review",
                  style: TextStyle(
                    color: AppColors.kDarkBlue,
                    fontFamily: AppFonts.kPoppins700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MyCustomField(
                  hintText: "Write your review here",
                  myController: myController,
                  textAlign: TextAlign.start,
                  maxLines: null,
                ),
                SizedBox(
                  height: 15.h,
                ),
                DoneBTN(
                  myBtn: myBtn,
                  productId: widget.productId,
                  reviewId: widget.reviewId,
                  userComment: widget.userComment,
                  rating: widget.rating,
                  myController: myController,
                  onTap: () {
                    if (widget.productId != null) {
                      context.read<AddCommentCubit>().product =
                          widget.productId!;
                      context.read<AddCommentCubit>().title = myController.text;
                      context
                          .read<AddCommentCubit>()
                          .addNewComment(context: context);
                    } else if (widget.reviewId != null) {
                      if (widget.userComment != myController.text ||
                          widget.rating !=
                              context.read<AddCommentCubit>().ratings) {
                        context.read<EditReviewCubit>().editReview(
                              reviewId: widget.reviewId!,
                              comment: myController.text,
                              ratings: context.read<AddCommentCubit>().ratings,
                            );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
