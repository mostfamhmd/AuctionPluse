import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/AppBar/home_app_bar.dart';

import 'name_and_icon_page.dart';

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
      backgroundColor: AppColors.kWhite,
      elevation: 3,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      currentIndex: _currentIndex,

      items: [
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: _currentIndex,
            myIndex: 0,
            pageIcon: AppIcons.kHome,
            pageName: "Home",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: _currentIndex,
            myIndex: 1,
            pageIcon: AppIcons.kCart,
            pageName: "Cart",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: _currentIndex,
            myIndex: 2,
            pageIcon: AppIcons.kOffer,
            pageName: "Offer",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: _currentIndex,
            myIndex: 3,
            pageIcon: AppIcons.kUser,
            pageName: "Account",
          ),
          label: "",
        ),
      ],
    );
  }
}

