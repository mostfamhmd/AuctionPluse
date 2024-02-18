import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/search_app_bar.dart';
import 'package:smart_auction/core/widgets/My%20Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/home_body.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(),
      endDrawer: const MyDrawer(),
      body: const HomeBody(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
