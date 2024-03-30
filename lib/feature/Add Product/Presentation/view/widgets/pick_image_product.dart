import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class PickImageProduct extends StatelessWidget {
  const PickImageProduct({super.key, this.cameraTap, this.gallaryTap});
  final void Function()? cameraTap;
  final void Function()? gallaryTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4.5,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: gallaryTap,
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: 70.sp,
                        color: Colors.black,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppFonts.kPoppins400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: cameraTap,
                child: SizedBox(
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 70.sp,
                        color: Colors.black,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppFonts.kPoppins400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
