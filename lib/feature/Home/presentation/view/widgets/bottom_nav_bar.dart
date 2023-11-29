import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.kLightBlue,
        unselectedItemColor: AppColors.kGray,
        selectedLabelStyle: AppStyles.kPoppins700
            .copyWith(fontSize: 10.sp, color: AppColors.kLightBlue),
        unselectedLabelStyle: AppStyles.kPoppins400
            .copyWith(fontSize: 10.sp, color: AppColors.kGray),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.kHome,
              colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? AppColors.kLightBlue : AppColors.kGray,
                  BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.kExplore,
              colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? AppColors.kLightBlue : AppColors.kGray,
                  BlendMode.srcIn),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.kCart,
              colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? AppColors.kLightBlue : AppColors.kGray,
                  BlendMode.srcIn),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.kOffer,
              colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? AppColors.kLightBlue : AppColors.kGray,
                  BlendMode.srcIn),
            ),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.kUser,
              colorFilter: ColorFilter.mode(
                  _currentIndex == 4 ? AppColors.kLightBlue : AppColors.kGray,
                  BlendMode.srcIn),
            ),
            label: "Account",
          ),
        ]);
  }
}
