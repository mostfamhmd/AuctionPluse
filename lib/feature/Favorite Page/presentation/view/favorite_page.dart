import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/view/widgets/body_favorite_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyFavoritePage(),
      appBar: backAppBar(context, "Favorite Product"),
    );
  }
}
