import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Credit%20Card/presentation/view/widgets/body_cerdit_card_page.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Credit Card Or Debit"),
      body: const BodyCreditCardPage(),
      resizeToAvoidBottomInset: false,
    );
  }
}
