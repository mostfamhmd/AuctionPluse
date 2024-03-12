import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';

class AddBrandBody extends StatelessWidget {
  const AddBrandBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameBrand = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Brand image",
              style: AppStyles.kPoppins400
                  .copyWith(fontSize: 20.sp, color: AppColors.kGray),
            ),
            SizedBox(
              height: 40.h,
            ),
            SvgPicture.asset(
              AppImages.kDefualt,
            ),
            SizedBox(
              height: 40.h,
            ),
            MyCustomField(
              myController: nameBrand,
              textAlign: TextAlign.center,
              hintText: "Brand name",
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () async {},
              child: Container(
                height: 45.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: AppColors.kLightBlue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                    child: Text(
                  "Add Brand",
                  style: AppStyles.kPoppins500
                      .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
