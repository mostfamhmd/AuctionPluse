import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Add%20Card/presentation/view/widgets/body_add_card.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Add Card"),
      body: const BodyAddCard(),
    );
  }
}
