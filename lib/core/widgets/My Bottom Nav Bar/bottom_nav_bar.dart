// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';

import 'name_and_icon_page.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.currentIndex});
  late int currentIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.kWhite,
      elevation: 3,
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;
        });
      },
      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: widget.currentIndex,
            myIndex: 0,
            pageIcon: AppIcons.kHome,
            pageName: "Home",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: widget.currentIndex,
            myIndex: 1,
            pageIcon: AppIcons.kCart,
            pageName: "Cart",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: widget.currentIndex,
            myIndex: 2,
            pageIcon: AppIcons.kOffer,
            pageName: "Offer",
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: NameAndIconPage(
            currentIndex: widget.currentIndex,
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
