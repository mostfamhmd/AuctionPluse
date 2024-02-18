import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/app_bar_search_result.dart';
import 'package:smart_auction/feature/Search%20Result/presentation/view/widgets/body_search_result_page.dart';

import '../../../../core/widgets/Drawer/body_profile_drawer.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchResultAppBar(),
      body: const BodySearchResultPage(),
    );
  }
}


