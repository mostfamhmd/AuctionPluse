import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/My%20Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:smart_auction/feature/Super%20Flash%20Sale%20Page/Presentation/view/widgets/body_super_flash_sale_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/widgets/AppBar/back_widget_app_bar.dart';
import '../../../Search Page/presentation/view/search_page.dart';

class SuperFlashSalePage extends StatelessWidget {
  const SuperFlashSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodySuperFlashSalePage(),
      bottomNavigationBar: const BottomNavBar(),
      appBar: backWidgetAppBar(
        context,
        "Super Flash Sale",
        AppIcons.kSearch,
        AppColors.kGray,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
      ),
    );
  }
}
