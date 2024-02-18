import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Sort%20Page/presentation/view/widget/body_sort_page.dart';

import '../../../../core/widgets/AppBar/back_app_bar.dart';

class SortPage extends StatelessWidget {
  const SortPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Sort By"),
      body: const BodySortPage(),
    );
  }
}
