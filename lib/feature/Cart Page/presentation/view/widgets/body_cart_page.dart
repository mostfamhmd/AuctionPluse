import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/swipe_to_delete.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/total_price.dart';

import 'apply_btn.dart';

class BodyCartPage extends StatelessWidget {
  const BodyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SwipeToDelete(
              length: 5,
            ),
            SizedBox(
              height: 10.h,
            ),
            MyCustomSuffixField(
              myController: TextEditingController(),
              isIcon: false,
              textAlign: TextAlign.start,
              hintText: "Enter Cupon Code",
              widget: InkWell(
                onTap: () {},
                child: const ApplyBTN(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const TotalPrice(),
            SizedBox(
              height: 40.h,
            ),
            MyBigBTN(
              nameBTN: "Check Out",
              onTap: () {},
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
