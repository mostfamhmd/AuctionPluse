import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/Widgets/body_cate_page.dart';

import '../../../../core/widgets/AppBar/my_custom_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Category"),
      body: const BodyCategoryPage(),
    );
  }
}
