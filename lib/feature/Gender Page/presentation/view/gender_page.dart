import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Gender%20Page/presentation/view/widgets/body_gender.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Gender"),
      body: const BodyGender(),
    );
  }
}
