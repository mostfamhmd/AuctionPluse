import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/rating_comment.dart';

import '../../../../../core/widgets/Components/my_custom_field.dart';

class BodyWriteCommentsPage extends StatefulWidget {
  const BodyWriteCommentsPage({super.key, required this.productId});
  final String productId;
  @override
  State<BodyWriteCommentsPage> createState() => _BodyWriteCommentsPageState();
}

class _BodyWriteCommentsPageState extends State<BodyWriteCommentsPage> {
  TextEditingController myController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCommentCubit, AddCommentState>(
      listener: (context, state) {
        if (state is AddCommentSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          isLoading.value = false;
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
      child: SingleChildScrollView(
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
              Center(
                child: MySmallBTN(
                  onTap: () {
                    context.read<AddCommentCubit>().product = widget.productId;
                    context.read<AddCommentCubit>().title = myController.text;
                    context
                        .read<AddCommentCubit>()
                        .addNewComment(context: context);
                  },
                  nameButton: "",
                  child: ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, bool value, Widget? child) =>
                            value
                                ? const Center(
                                    child: LoadingState(),
                                  )
                                : Center(
                                    child: Text(
                                      "Add a comment",
                                      style: AppStyles.kPoppins500.copyWith(
                                          fontSize: 18.sp,
                                          color: AppColors.kBlack),
                                    ),
                                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
