import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/search_app_bar.dart';
import 'package:smart_auction/feature/Search%20Page/presentation/view/widgets/body_search_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodySearchPage(),
      appBar: searchAppBar(context),
    );
  }
}
