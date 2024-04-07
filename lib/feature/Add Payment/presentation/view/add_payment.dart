import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Add%20Payment/presentation/view/widgets/body_add_payment.dart';

class AddPayementPage extends StatelessWidget {
  const AddPayementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Payment"),
      body: const BodyAddPayment(),
    );
  }
}
