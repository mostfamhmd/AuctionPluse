import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Change%20Image%20Page/presentation/view/widgets/app_bar_change_image.dart';
import 'package:smart_auction/feature/Change%20Image%20Page/presentation/view/widgets/body_change_image.dart';

class ChangeImageScreen extends StatelessWidget {
  const ChangeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChangeImage(context, () {}),
      body: const BodyChangeImage(),
    );
  }
}
