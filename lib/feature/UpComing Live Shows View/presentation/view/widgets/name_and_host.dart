import 'package:flutter/material.dart';

import 'host_text.dart';
import 'name_text.dart';

class NameAndHost extends StatelessWidget {
  const NameAndHost({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NameText(
          name: name,
        ),
        const HostText(),
      ],
    );
  }
}
