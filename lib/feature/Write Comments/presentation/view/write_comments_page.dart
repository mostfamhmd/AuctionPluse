import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/body_write_comments_page.dart';

import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class WriteCommentsPage extends StatelessWidget {
  const WriteCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, " Write Review"),
      body: const BodyWriteCommentsPage(),
      bottomNavigationBar: const BottomNavBar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
