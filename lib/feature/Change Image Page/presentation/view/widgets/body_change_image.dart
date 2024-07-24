import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class BodyChangeImage extends StatelessWidget {
  const BodyChangeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 150,
            ),
            SizedBox(height: size.height * 0.02),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Choose image',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.kInter500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
