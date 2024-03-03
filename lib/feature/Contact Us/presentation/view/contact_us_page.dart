import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Contact%20Us/presentation/view/widgets/body_contact_us_page.dart';

import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyContactUsPage(),
      bottomNavigationBar: BottomNavBar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
