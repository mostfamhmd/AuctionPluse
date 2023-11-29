import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/AppBar/my_app_bar.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/home_body.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/my_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      endDrawer: const MyDrawer(),
      body: const HomeBody(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
