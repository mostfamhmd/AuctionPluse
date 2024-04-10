import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/EditReviewCubit/edit_review_cubit.dart';

class DoneBTN extends StatelessWidget {
  DoneBTN(
      {super.key,
      this.productId,
      this.reviewId,
      this.userComment,
      this.rating,
      required this.myController,
      required this.myBtn,
      this.onTap});
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final String? productId;
  final String? reviewId;
  final String? userComment;
  final num? rating;
  final TextEditingController myController;
  final String myBtn;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditReviewCubit, EditReviewState>(
      listener: (context, state) {
        if (state is EditReviewSuccess) {
          isLoading.value = false;
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          mySnackBar(context, "Updated Successfully");
        } else if (state is EditReviewLoading) {
          isLoading.value = true;
        } else if (state is EditReviewFailure) {
          mySnackBar(context, state.error.toString());
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      },
      child: Center(
        child: MySmallBTN(
          onTap: onTap,
          nameButton: "",
          child: ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (BuildContext context, bool value, Widget? child) => value
                ? const Center(
                    child: LoadingState(),
                  )
                : Center(
                    child: Text(
                      myBtn,
                      style: AppStyles.kPoppins500
                          .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
