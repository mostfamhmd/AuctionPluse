// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/home_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Account%20Page/presentation/view/widgets/app_bar_account_page.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/body_cart_page.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/home_body.dart';
import 'package:smart_auction/feature/Super%20Flash%20Sale%20Page/Presentation/view/widgets/body_super_flash_sale_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/widgets/AppBar/name_app_bar.dart';
import '../../../../core/widgets/My Bottom Nav Bar/name_and_icon_page.dart';
import '../../../Account Page/presentation/view/widgets/body_account.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key, this.currentIndex = 0});
  late int currentIndex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> body = const [
      HomeBody(),
      BodyCartPage(),
      BodySuperFlashSalePage(),
      BodyAccount(),
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
      appBarAccountPage(),
    ];
    return Scaffold(
      appBar: appBar[widget.currentIndex],
      body: body[widget.currentIndex],
      endDrawer: widget.currentIndex != 3 ? const MyDrawer() : null,
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
