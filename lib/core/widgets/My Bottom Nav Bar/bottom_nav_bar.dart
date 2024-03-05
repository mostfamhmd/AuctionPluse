import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/AppBar/home_app_bar.dart';

import '../../../feature/Cart Page/presentation/view/widgets/body_cart_page.dart';
import '../../../feature/Home/presentation/view/widgets/home_body.dart';
import '../../../feature/Super Flash Sale Page/Presentation/view/widgets/body_super_flash_sale_page.dart';
import '../AppBar/name_app_bar.dart';
import '../Drawer/my_drawer.dart';
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
    List<Widget> body = const [
      HomeBody(),
      BodyCartPage(),
      BodySuperFlashSalePage(),
      Center(
        child: Text("Account Page"),
      ),
    ];
    List<PreferredSizeWidget> appBar = [
      homeAppBar(context),
      nameAppBar(
        context,
        "Your Cart",
      ),
      nameAppBar(
        context,
        "Super Flash Sale",
      ),
      nameAppBar(
        context,
        "Account",
      ),
    ];
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

