import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Contact%20Us/presentation/view/widgets/body_contact_us_page.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyContactUsPage(),
      resizeToAvoidBottomInset: false,
    );
  }
}
