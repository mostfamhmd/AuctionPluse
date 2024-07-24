import 'package:flutter/material.dart';

import 'package:smart_auction/feature/Set%20New%20Password/presentation/view/widgets/body_set_new_password.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BodySetNewPassword(),
    );
  }
}
