import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class ListViewPages extends StatelessWidget {
  const ListViewPages({
    super.key,
    required this.icons,
    required this.pages,
    required this.titles,
  });

  final List<String> icons;
  final List<Widget> pages;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: icons.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pages[index],
          ),
        ),
        leading: SvgPicture.asset(
          icons[index],
          colorFilter:
              const ColorFilter.mode(AppColors.kLightBlue, BlendMode.srcIn),
        ),
        title: Text(
          titles[index],
          style: const TextStyle(
            fontFamily: AppFonts.kPoppins700,
            fontSize: 14,
            color: AppColors.kDarkBlue,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
