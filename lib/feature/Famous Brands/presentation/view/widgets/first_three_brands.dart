import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/position_card_number.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/Components/edit_and_delete.dart';

class FirstThreeBrands extends StatefulWidget {
  const FirstThreeBrands({
    super.key,
    required this.rankColor,
    required this.rankNum,
    required this.topCard,
    required this.brand,
    required this.role,
    this.onPressedEdit,
    this.onPressedDelete,
  });

  final int rankColor;
  final int rankNum;
  final double topCard;
  final Brands brand;
  final String role;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;

  @override
  State<FirstThreeBrands> createState() => _FirstThreeBrandsState();
}

class _FirstThreeBrandsState extends State<FirstThreeBrands> {
  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  String userRole = "";

  Future<String> getUserRole() async {
    userRole = await AppConsts.getData(AppConsts.kUserRole);
    setState(() {});
    return userRole;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 385.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGray.withOpacity(0.2),
                blurStyle: BlurStyle.normal,
                blurRadius: 10.r,
                offset: const Offset(9, 9),
              ),
              BoxShadow(
                blurRadius: 10.r,
                color: AppColors.kGray.withOpacity(0.2),
                blurStyle: BlurStyle.normal,
                offset: const Offset(-9, -9),
              ),
            ],
          ),
          child: Row(children: [
            ImageComponent(
              urlImage: widget.brand.image!,
              height: 100.h,
              width: 100.w,
              radius: 10.r,
            ),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand.name!,
                    style: AppStyles.kPoppins700
                        .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            userRole == "admin"
                ? EditAndDelete(
                    onPressedEdit: widget.onPressedEdit,
                    onPressedDelete: widget.onPressedDelete,
                  )
                : const Center()
          ]),
        ),
        PositionCardRank(
            color: widget.rankColor,
            rankNum: widget.rankNum,
            top: widget.topCard),
      ],
    );
  }
}
