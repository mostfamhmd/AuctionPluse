import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Payment%20Page/presentation/view/widgets/body_payment_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyPaymentPage(),
      appBar: backAppBar(context, "Payment"),
    );
  }
}
