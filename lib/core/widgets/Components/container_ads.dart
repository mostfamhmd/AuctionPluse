import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerAds extends StatelessWidget {
  const ContainerAds({super.key, required this.pathImageAds, this.onTap});

  final String pathImageAds;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200.h,
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          image: DecorationImage(
            image: AssetImage(
              pathImageAds,
            ),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
